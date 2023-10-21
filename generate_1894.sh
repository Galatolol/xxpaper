#! /bin/bash

SOURCE_FILE='games/1894-Papers.xxp'
SOURCE_FILE_TOKENS='games/1894-Papers-tokens.xxp'
TOKEN_OBJECT_NAME='XXP_token_objects.xxp'
TOKEN_OBJECT_NAME_ALT='cXXP_token_objects.xxp'
CATALOG='1894'

xxpaper make assets $SOURCE_FILE -p A4 $CATALOG/papers.pdf
qpdf $CATALOG/papers.pdf --pages . 1-10 -- --replace-input
mv $TOKEN_OBJECT_NAME_ALT $TOKEN_OBJECT_NAME
xxpaper make assets $SOURCE_FILE_TOKENS -c -p A4 $CATALOG/tokens.pdf
qpdf $CATALOG/tokens.pdf --pages . 11 -- --replace-input
mv $TOKEN_OBJECT_NAME $TOKEN_OBJECT_NAME_ALT