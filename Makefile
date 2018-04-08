PACKAGE=freemote
VERSION=0.1

all:

xgettext: ${PACKAGE}/locale/${PACKAGE}.pot

msginit: ${PACKAGE}/locale/fr_FR/LC_MESSAGES/${PACKAGE}.po
msgmerge: ${PACKAGE}/locale/fr_FR/LC_MESSAGES/${PACKAGE}.po

msgfmt:  ${PACKAGE}/locale/fr_FR/LC_MESSAGES/${PACKAGE}.mo

${PACKAGE}/locale/${PACKAGE}.pot: ${PACKAGE}/${PACKAGE}
	xgettext \
		--default-domain=${PACKAGE} \
		--package-name=${PACKAGE} \
		--package-version=${VERSION} \
		--foreign-user \
		--msgid-bugs-address=${EMAIL} \
		--from-code=UTF-8 \
		--language=Python \
		--output=${PACKAGE}/locale/${PACKAGE}.pot \
		${PACKAGE}/${PACKAGE}

${PACKAGE}/locale/fr_FR/LC_MESSAGES/${PACKAGE}.po: ${PACKAGE}/locale/${PACKAGE}.pot
	if [ -e ${PACKAGE}/locale/fr_FR/LC_MESSAGES/${PACKAGE}.po ] ; then \
		msgmerge \
			--update \
			--backup=numbered \
			--previous \
			${PACKAGE}/locale/fr_FR/LC_MESSAGES/${PACKAGE}.po \
			${PACKAGE}/locale/${PACKAGE}.pot ; \
	else \
		msginit \
			--input=${PACKAGE}/locale/${PACKAGE}.pot \
			--output-file=${PACKAGE}/locale/fr_FR/LC_MESSAGES/${PACKAGE}.po \
			--${PACKAGE}/locale=fr_FR ; \
	fi

${PACKAGE}/locale/fr_FR/LC_MESSAGES/${PACKAGE}.mo: ${PACKAGE}/locale/fr_FR/LC_MESSAGES/${PACKAGE}.po
	msgfmt \
		${PACKAGE}/locale/fr_FR/LC_MESSAGES/${PACKAGE}.po \
		--output-file=${PACKAGE}/locale/fr_FR/LC_MESSAGES/${PACKAGE}.mo
