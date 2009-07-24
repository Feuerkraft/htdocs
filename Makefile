HTMLOUT = \
 welcome.html  \
 news.html  \
 download.html \
 screenshots.html \
 screenshots-0.1.html \
 screenshots-0.0.html \
 contact.html \
 artworks.html \
 development.html

all : $(HTMLOUT)

clean :
	rm -vf $(HTMLOUT)

$(patsubst %,%,$(HTMLOUT)): %.html: %.xml default.xsl
	FILENAME=$<; \
	LASTCHANGE=`date -I`; \
	echo $${FILENAME%%.xml}; \
	xalan \
          -param filename   "'$${FILENAME%%.xml}'" \
          -param lastchange "'$${LASTCHANGE}'" \
          -in $< \
          -out $@ \
          -xsl default.xsl

index.html : index.xml
	cp -v $< $@

# commit: all
# 	cvs commit -m "automatic webpage update"

# upload: commit

#tidy -asxml -indent -quiet -modify $@

.PHONY: all clean upload

# EOF #