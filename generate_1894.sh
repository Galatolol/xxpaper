#! /bin/bash

SOURCE_FILE='games/1894-Papers.xxp'
SOURCE_FILE_TOKENS='games/1894-Papers-tokens.xxp'
TOKEN_OBJECT_NAME='XXP_token_objects.xxp'
TOKEN_OBJECT_NAME_ALT='cXXP_token_objects.xxp'
CATALOG='1894'

mkdir -p $CATALOG

xxpaper make assets $SOURCE_FILE -p A4 $CATALOG/papers-die-A4.pdf
qpdf $CATALOG/papers-die-A4.pdf --pages . 1-r2 -- --replace-input
xxpaper make assets $SOURCE_FILE -p A4 -c $CATALOG/papers-outline-A4.pdf
qpdf $CATALOG/papers-outline-A4.pdf --pages . 1-r2 -- --replace-input
mv $TOKEN_OBJECT_NAME_ALT $TOKEN_OBJECT_NAME
xxpaper make assets $SOURCE_FILE_TOKENS -p A4 $CATALOG/markers-A4.pdf
qpdf $CATALOG/markers-A4.pdf --pages . 11 -- --replace-input
mv $TOKEN_OBJECT_NAME $TOKEN_OBJECT_NAME_ALT


xxpaper make assets $SOURCE_FILE -p letter $CATALOG/papers-die-letter.pdf
qpdf $CATALOG/papers-die-letter.pdf --pages . 1-r2 -- --replace-input
xxpaper make assets $SOURCE_FILE -p letter -c $CATALOG/papers-outline-letter.pdf
qpdf $CATALOG/papers-outline-letter.pdf --pages . 1-r2 -- --replace-input
mv $TOKEN_OBJECT_NAME_ALT $TOKEN_OBJECT_NAME
xxpaper make assets $SOURCE_FILE_TOKENS -p letter $CATALOG/markers-letter.pdf
qpdf $CATALOG/markers-letter.pdf --pages . 11 -- --replace-input
mv $TOKEN_OBJECT_NAME $TOKEN_OBJECT_NAME_ALT