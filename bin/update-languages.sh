#!/usr/bin/env bash

if [ ! -f "limit-login-attempts-ng.php" ]; then
	echo "This script must be called in the main plugin directory."
	exit 1
fi

if [ ! -d "languages" ]; then
	echo "Missing languages directory."
	exit 1
fi

wp i18n make-pot . languages/limit-login-attempts.pot

pushd languages >/dev/null

for po in limit-login-attempts-*.po; do
	mo=${po%.po}.mo

	echo -n "Updating "
	echo $po | sed -nE 's/.*-([a-z]{2}_?[A-Z]?[A-Z]?).po$/\1/p' | tr -d "\n"

	msgmerge --backup=none --update $po limit-login-attempts.pot
	msgfmt $po -o $mo
done

popd >/dev/null

echo "All done."


