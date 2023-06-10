#!/usr/bin/env bash

# Based on a script found at GPG mailing list: https://lists.gnupg.org/pipermail/gnupg-users/2003-October/020402.html

html=$1
temp_dir=/tmp/pgp-html-$$

echo "Copying file $1 to $temp_dir in order to be signed"
(echo '-->'; cat "$html"; echo '<!--') > $temp_dir

echo "Signing $temp_dir and renaming to $html"
(echo '<!--'; gpg --clearsign --output - $temp_dir ; echo '-->') > "$html"

echo "Cleaning the garbage..."
rm $temp_dir
