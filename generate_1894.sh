#! /bin/bash

SOURCE_FILE='games/1894-Papers.xxp'
SOURCE_FILE_TOKENS='games/1894-Papers-tokens.xxp'
TOKEN_OBJECT_NAME='XXP_token_objects.xxp'
TOKEN_OBJECT_NAME_ALT='cXXP_token_objects.xxp'
CATALOG='1894'

mkdir -p $CATALOG

xxpaper make assets $SOURCE_FILE -p A4 $CATALOG/papers.pdf
qpdf $CATALOG/papers.pdf --pages . 1-10 -- --replace-input
mv $TOKEN_OBJECT_NAME_ALT $TOKEN_OBJECT_NAME
xxpaper make assets $SOURCE_FILE_TOKENS -c -p A4 $CATALOG/markers-A4.pdf
qpdf $CATALOG/markers-A4.pdf --pages . 11 -- --replace-input
mv $TOKEN_OBJECT_NAME $TOKEN_OBJECT_NAME_ALT


xxpaper make assets $SOURCE_FILE -p letter $CATALOG/papers-letter.pdf
qpdf --pages $CATALOG/papers-letter.pdf 1-r2 -- $CATALOG/papers-letter.pdf --replace-input
mv $TOKEN_OBJECT_NAME_ALT $TOKEN_OBJECT_NAME
xxpaper make assets $SOURCE_FILE_TOKENS -c -p letter $CATALOG/markers-letter.pdf
qpdf $CATALOG/markers-letter.pdf --pages . 11 -- --replace-input
mv $TOKEN_OBJECT_NAME $TOKEN_OBJECT_NAME_ALT