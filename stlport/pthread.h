/*
 * Copyright (c) 1999
 * Boris Fomitchev
 *
 * This material is provided "as is", with absolutely no warranty expressed
 * or implied. Any use is at your own risk.
 *
 * Permission to use or copy this software for any purpose is hereby granted
 * without fee, provided the above notices are retained on all copies.
 * Permission to modify the code and to distribute modified code is granted,
 * provided the above notices are retained, and a notice that the code was
 * modified is included with the above copyright notice.
 *
 */

#if !defined (_STLP_OUTERMOST_HEADER_ID)
#  define _STLP_OUTERMOST_HEADER_ID 0x280
#  include <stl/_prolog.h>
#elif (_STLP_OUTERMOST_HEADER_ID == 0x280) && ! defined (_STLP_DONT_POP_HEADER_ID)
#  define _STLP_DONT_POP_HEADER_ID
#endif

#if defined (__SUNPRO_CC) || defined (__HP_aCC)
#  include "/usr/include/pthread.h"
#else
#  if defined (_STLP_HAS_INCLUDE_NEXT)
#    include_next <pthread.h>
#  else
#    include _STLP_NATIVE_C_HEADER(pthread.h)
#  endif
#endif

#if (_STLP_OUTERMOST_HEADER_ID == 0x280)
#  if !defined (_STLP_DONT_POP_HEADER_ID)
#    include <stl/_epilog.h>
#    undef  _STLP_OUTERMOST_HEADER_ID
#  else
#    undef  _STLP_DONT_POP_HEADER_ID
#  endif
#endif

#if defined(__ANDROID__)
#ifndef _PTHREAD_BARRIER_
#define _PTHREAD_BARRIER_

typedef struct pthread_barrier_t {
  /* FIXME implement */
} pthread_barrier_t;

typedef struct pthread_barrierattr_t {
  /* FIXME implement */
} pthread_barrierattr_t;

#define PTHREAD_BARRIER_SERIAL_THREAD -1

#ifdef __cplusplus
extern "C" {
#endif

int pthread_barrier_init (pthread_barrier_t*, const pthread_barrierattr_t*, unsigned);
int pthread_barrier_destroy (pthread_barrier_t*);
int pthread_barrier_wait (pthread_barrier_t*);
int pthread_barrierattr_init (pthread_barrierattr_t*);
int pthread_barrierattr_destroy (pthread_barrierattr_t*);
int pthread_barrierattr_getpshared (const pthread_barrierattr_t*, int*);
int pthread_barrierattr_setpshared (pthread_barrierattr_t*, int);

#ifdef __cplusplus
}
#endif

#endif /* _PTHREAD_BARRIER_ */
#endif /* __ANDROID__ */

/*
 Local Variables:
 mode:C++
 End:
*/
