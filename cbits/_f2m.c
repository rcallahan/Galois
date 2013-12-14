#include "stdlib.h"
#include "ghcautoconf.h"
#define BTS(x) (sizeof(long) * 8 * x)

typedef unsigned long ulong;

int _clz(ulong x) {
    return __builtin_clz(x);
}

static const char SQR_tb[16] =
  {     0,     1,     4,     5,    16,    17,    20,    21,
       64,    65,    68,    69,    80,    81,    84,    85 };

#define _SQR_tb(w,lk,sh) ((ulong)(SQR_tb[(w) >> (lk) & 0xF]) << (sh))
#if (SIZEOF_VOID_P == 8)
#define SQR1(w) \
    _SQR_tb((w), 60, 56) | _SQR_tb((w), 56, 48) | \
    _SQR_tb((w), 52, 40) | _SQR_tb((w), 48, 32) | \
    _SQR_tb((w), 44, 24) | _SQR_tb((w), 40, 16) | \
    _SQR_tb((w), 36,  8) | _SQR_tb((w), 32,  0)
#define SQR0(w) \
    _SQR_tb((w), 28, 56) | _SQR_tb((w), 24, 48) | \
    _SQR_tb((w), 20, 40) | _SQR_tb((w), 16, 32) | \
    _SQR_tb((w), 12, 24) | _SQR_tb((w),  8, 16) | \
    _SQR_tb((w),  4,  8) | _SQR_tb((w),  0,  0)
#elif (SIZEOF_VOID_P == 4)
#define SQR1(w) \
    _SQR_tb((w), 28, 24) | _SQR_tb((w), 24, 16) | \
    _SQR_tb((w), 20,  8) | _SQR_tb((w), 16,  0)
#define SQR0(w) \
    _SQR_tb((w), 12, 24) | _SQR_tb((w),  8, 16) | \
    _SQR_tb((w),  4,  8) | _SQR_tb((w),  0,  0)
#endif

inline int find_top(int sz, ulong *arr) {
    int i;
    for (i=sz-1; i>=0; i--) {
        if (arr[i] != 0)
            return (sz+1);
    }
    return 0;
}

inline int find_top_bit(int sz, ulong *arr) {
    int i, tmp;
    for (i=sz-1; i>=0; i--) {
        if (0 != (tmp = arr[i]))
            return (BTS(i) + __builtin_clz(tmp));
    }
    return 0;
}

void gf2m_sqr(ulong *r, const size_t sz, const ulong *a) {
    int i;

    for (i=0; i < sz; i++) {
        r[2*i+1] = SQR1(a[i]);
        r[2*i] = SQR0(a[i]);
    }
}

void gf2m_mul(ulong *r, const size_t asz, const ulong *a, const size_t bsz, const ulong *b) {
    int i, j;
    ulong tab[16];

    for (i=0; i<(asz+bsz+1); i++)
        r[i] = 0;

    ulong x, y;
    for (i=0; i<asz; i++) {
        x = a[i];
        ulong h, l, s, top3b = x >> 61;
        ulong a1, a2, a4, a8;
        a1 = x & (0x1FFFFFFFFFFFFFFFULL); a2 = a1 << 1; a4 = a2 << 1; a8 = a4 << 1;

        tab[ 0] = 0;     tab[ 1] = a1;       tab[ 2] = a2;       tab[ 3] = a1^a2;
        tab[ 4] = a4;    tab[ 5] = a1^a4;    tab[ 6] = a2^a4;    tab[ 7] = a1^a2^a4;
        tab[ 8] = a8;    tab[ 9] = a1^a8;    tab[10] = a2^a8;    tab[11] = a1^a2^a8;
        tab[12] = a4^a8; tab[13] = a1^a4^a8; tab[14] = a2^a4^a8; tab[15] = a1^a2^a4^a8;

        for (j=0; j<bsz; j++) {
            y = b[j];
            s = tab[y       & 0xF]; l  = s;
            s = tab[y >>  4 & 0xF]; l ^= s <<  4; h  = s >> 60;
            s = tab[y >>  8 & 0xF]; l ^= s <<  8; h ^= s >> 56;
            s = tab[y >> 12 & 0xF]; l ^= s << 12; h ^= s >> 52;
            s = tab[y >> 16 & 0xF]; l ^= s << 16; h ^= s >> 48;
            s = tab[y >> 20 & 0xF]; l ^= s << 20; h ^= s >> 44;
            s = tab[y >> 24 & 0xF]; l ^= s << 24; h ^= s >> 40;
            s = tab[y >> 28 & 0xF]; l ^= s << 28; h ^= s >> 36;
            s = tab[y >> 32 & 0xF]; l ^= s << 32; h ^= s >> 32;
            s = tab[y >> 36 & 0xF]; l ^= s << 36; h ^= s >> 28;
            s = tab[y >> 40 & 0xF]; l ^= s << 40; h ^= s >> 24;
            s = tab[y >> 44 & 0xF]; l ^= s << 44; h ^= s >> 20;
            s = tab[y >> 48 & 0xF]; l ^= s << 48; h ^= s >> 16;
            s = tab[y >> 52 & 0xF]; l ^= s << 52; h ^= s >> 12;
            s = tab[y >> 56 & 0xF]; l ^= s << 56; h ^= s >>  8;
            s = tab[y >> 60      ]; l ^= s << 60; h ^= s >>  4;

            /* compensate for the top three bits of a */

            if (top3b & 01) { l ^= y << 61; h ^= y >> 3; } 
            if (top3b & 02) { l ^= y << 62; h ^= y >> 2; } 
            if (top3b & 04) { l ^= y << 63; h ^= y >> 1; } 

            r[i+j+1] ^= h; r[i+j] ^= l;
        }
    }
}

int gf2m_mod(ulong *r, const size_t asz, const ulong *a, const size_t psz, const ulong *p) {
    int j, k;
    int n, dN, d0, d1;
    ulong zz;

    for (j=0; j<asz; j++)
        r[j] = a[j];

    /* start reduction */
    dN = p[0] / BTS(1);  
    for (j = asz - 1; j > dN;) {
        zz = r[j];
        if (r[j] == 0) { j--; continue; }
        r[j] = 0;

        for (k = 1; k < psz; k++) {
            /* reducing component t^p[k] */
            n = p[0] - p[k];
            d0 = n % BTS(1);  d1 = BTS(1) - d0;
            n /= BTS(1); 
            r[j-n] ^= (zz>>d0);
            if (d0) r[j-n-1] ^= (zz<<d1);
        }
    }

    /* final round of reduction */
    while (j == dN) {
        d0 = p[0] % BTS(1);
        zz = r[dN] >> d0;
        if (zz == 0) break;
        d1 = BTS(1) - d0;
        
        /* clear up the top d1 bits */
        if (d0)
            r[dN] = (r[dN] << d1) >> d1;
        else
            r[dN] = 0;
        r[0] ^= zz; /* reduction t^0 component */

        for (k = 1; p[k] != 0; k++) {
            long tmp_ulong;

            /* reducing component t^p[k]*/
            n = p[k] / BTS(1);   
            d0 = p[k] % BTS(1);
            d1 = BTS(1) - d0;
            r[n] ^= (zz << d0);
            tmp_ulong = zz >> d1;
            if (d0 && tmp_ulong)
                r[n+1] ^= tmp_ulong;
        }
    }
    return find_top(asz, r);
}


int gf2m_div (ulong *r, size_t xsz, ulong *xba, size_t asz, ulong *aba, size_t top, ulong *pba) {
    ulong barr[top], carr[top], uarr[top], varr[top];
    ulong *bba = barr;
    ulong *cba = carr;
    ulong *uba = uarr;
    ulong *vba = varr;

    int i;

    for (i=0; i<top; i++) {
        if (i < xsz) { bba[i] = xba[i]; }
        else {bba[i] = 0;}
        cba[i] = 0;
        if (i < asz) { uba[i] = aba[i]; }
        else { uba[i] = 0; }
        vba[i] = pba[i];
    }
    int ubits, vbits;

    vbits = find_top_bit(top, vba);

    ubitsize:
    ubits = find_top_bit(top, uba);

    ulong u0, u1, b0, b1, mask, tmp;
    ulong *tmptr;

    while (1) {
        u0 = uba[0];
        if (ubits > 0 && !(u0&1)) {
            b0 = bba[0];
            mask = 0-(b0&1);
            b0 = b0 ^ (pba[0]&mask);
            for (i=0; i<top-1; i++) {
                u1 = uba[i+1];
                uba[i] = (u0>>1)|(u1<<(BTS(1)-1));
                u0 = u1;
                b1 = bba[i+1] ^ (pba[i+1]&mask);
                bba[i] = (b0>>1)|(b1<<(BTS(1)-1));
                b0 = b1;
            }
            uba[i] = u0 >> 1;
            bba[i] = b0 >> 1;
            ubits--;
        }

        if (ubits <= BTS(1) && uba[0] == 1) break;

        if (ubits < vbits) {
            tmp = ubits; ubits = vbits; vbits = tmp;
            tmptr = uba; uba = vba; vba = tmptr;
            tmptr = bba; bba = cba; cba = tmptr;
        }

        for (i=0; i<top; i++) {
            uba[i] = uba[i] ^ vba[i];
            bba[i] = bba[i] ^ cba[i];
        }

        if (ubits == vbits) goto ubitsize;
    }

    for (i=0; i<top; i++)
        r[i] = bba[i];

    return find_top_bit(top, r);
}
