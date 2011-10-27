/*
* Implementation of fmemopen for the Cygwin platform
* Copyright (C) 2007 Graham Cox
* 
* This library is free software; you can redistribute it and/or
* modify it under the terms of the GNU Lesser General Public
* License as published by the Free Software Foundation; either
* version 2.1 of the License, or (at your option) any later version.
* 
* This library is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
* Lesser General Public License for more details.
* 
* You should have received a copy of the GNU Lesser General Public
* License along with this library; if not, write to the Free Software
* Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
*/
#ifndef  LEPTONICA__STDIO_H
#define  LEPTONICA__STDIO_H


#ifndef  BUILD_HOST


#include <stdint.h>


typedef struct cookie_io_functions_t {
        ssize_t (*read)(void *, char *, size_t);
        ssize_t (*write)(void *, const char *, size_t);
        int     (*seek)(void *, off_t *, int);
        int     (*close)(void *);
} cookie_io_functions_t;


FILE *fopencookie(void *cookie, const char *mode,
                  cookie_io_functions_t functions);


FILE *fmemopen(void *buf, size_t size, const char *mode);


FILE *open_memstream(char **buf, size_t *size);


#ifndef DEFFILEMODE
#define DEFFILEMODE  (S_IRUSR|S_IWUSR|S_IRGRP|S_IWGRP|S_IROTH|S_IWOTH)
#endif


/*
 * Information local to this implementation of stdio,
 * in particular, macros and private variables.
 */


int     __sflush(FILE *);
FILE    *__sfp(void);
int     __srefill(FILE *);
int     __sread(void *, char *, int);
int     __swrite(void *, const char *, int);
fpos_t  __sseek(void *, fpos_t, int);
int     __sclose(void *);
void    __sinit(void);
void    _cleanup(void);
void    __smakebuf(FILE *);
int     __swhatbuf(FILE *, size_t *, int *);
int     _fwalk(int (*)(FILE *));
int     __swsetup(FILE *);
int     __sflags(const char *, int *);


#endif


#endif  /* LEPTONICA__STDIO_H */
