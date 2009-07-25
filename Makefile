HTMLOUT = \
 build/welcome.html  \
 build/news.html  \
 build/download.html \
 build/screenshots.html \
 build/screenshots-0.1.html \
 build/screenshots-0.0.html \
 build/contact.html \
 build/artworks.html \
 build/development.html \
 build/index.html

all : $(HTMLOUT) build/default.css

clean :
	rm -vf $(HTMLOUT)

$(patsubst %,%,$(HTMLOUT)): build/%.html: %.xml default.xsl
	FILENAME=$<; \
	LASTCHANGE=`date -I`; \
	echo $${FILENAME%%.xml}; \
	xalan \
          -param filename   "'$${FILENAME%%.xml}'" \
          -param lastchange "'$${LASTCHANGE}'" \
          -in $< \
          -out $@ \
          -xsl default.xsl

build/index.html : index.xml
	cp -v $< $@

build/default.css : default.css
	cp -v $< $@

upload:
	rsync -rcvLP -C build/ grumbel@shell.berlios.de:/home/groups/feuerkraft/htdocs

# commit: all
# 	cvs commit -m "automatic webpage update"

# upload: commit

#tidy -asxml -indent -quiet -modify $@

.PHONY: all clean upload

# EOF #