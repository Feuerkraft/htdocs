<?xml version="1.0"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  
  <xsl:output 
    method="html" 
    indent="yes" 
    doctype-public="-//W3C//DTD HTML 4.01//EN" 
    doctype-system="http://www.w3.org/TR/html4/strict.dtd"
    encoding="ISO-8859-1" />

  <xsl:param name="filename"/>
  <xsl:param name="lastchange"/>
  
  <xsl:template match="node()|@*">
    <xsl:copy><xsl:apply-templates select="@* | node()" /></xsl:copy>
  </xsl:template>

  <xsl:template match="dlink">
    <a href="{@href}"><xsl:value-of select="substring-after(@href,'http://savannah.nongnu.org/download/feuerkraft/')"/></a>
  </xsl:template> 

  <xsl:template match="dlink-full">
    <a href="{@href}"><xsl:value-of select="@href"/></a>
  </xsl:template> 

  <xsl:template name="menuitem">
    <xsl:param name="name"/>    
    <xsl:param name="lowername"/>

    <xsl:choose>
      <xsl:when test="$filename = $lowername">
        <div><a class="currentmenuitem" href="{.}.html"><xsl:value-of select="."/></a></div>
      </xsl:when>
      <xsl:otherwise>
        <div><a class="menuitem" href="{.}.html"><xsl:value-of select="."/></a></div>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="page">
    <html>
      <head>
        <title>Feuerkraft - <xsl:value-of select="@title" /> - Page: <xsl:value-of select="$filename"/></title>
        <link rel="stylesheet" type="text/css" href="default.css" />
        <link rel="icon" href="images/favicon.png" type="image/png" />
        <!--<link REL="help" HREF="faq.html" title="FAQ"/>
        <link REL="section" HREF="faq.html" title="Intro"/>
        <link REL="shortcut icon" href="/favicon.ico" type="image/x-icon" />-->
      </head>
      <body style="margin:0px;" bgcolor="#a4a68e">
        <table summary="" cellpadding="0" cellspacing="0" border="0" width="100%">
          <colgroup width="180" />
          <tr>
            <td valign="top" align="center">
              <a href="http://fs.fsf.org/feuerkraft/"><img src="images/logo_feuerkraft.png" alt="Feuerkraft" border="0" /></a>

              <div><a class="menuitem" href="news.html">News</a></div>
              <div><a class="menuitem" href="welcome.html">Welcome</a></div>
              <div><a class="menuitem" href="artworks.html">Artworks</a></div>
              <div><a class="menuitem" href="screenshots.html">Screenshots</a></div>
              <div><a class="menuitem" href="development.html">Development</a></div>
              <div><a class="menuitem" href="download.html">Download</a></div>
              <div><a class="menuitem" href="contact.html">Contact</a></div>
              <br />
              <div><a class="menuitem" href="http://savannah.nongnu.org/projects/feuerkraft/">Savanna Project Page</a></div>
              <!--
              <br />
              <p>
              <a href="http://validator.w3.org/check/referer"><img
              src="http://www.w3.org/Icons/valid-xhtml10"
              alt="Valid XHTML 1.0!" height="31" width="88" /></a>
            </p>
              
              
              <p>
              <a href="http://jigsaw.w3.org/css-validator/">
              <img style="border:0;width:88px;height:31px"
              src="http://jigsaw.w3.org/css-validator/images/vcss" 
              alt="Valid CSS!" />
            </a>
            </p>
              -->
              <!--<img alt="" src="images/logo_gnu.jpg" width="150" height="130" />-->
            </td>
            <td valign="top" style="padding:20px;">
              <!--
              <table  summary="" border="0" width="100%" cellpadding="0" cellspacing="0">
              <tr>
              <td align="left" valign="bottom">
              <h1><xsl:value-of select="@title"/></h1>
            </td><td align="right">
              <img alt="" src="images/walking.png"/>
            </td>
            </tr>
            </table>
              <br />
              -->
              
              <h1><xsl:value-of select="@title"/></h1>

              <div class="mainbody">
                <xsl:apply-templates />
              </div>
              
              <div style="font-size: smaller; text-align: right; background-color: gray; padding: 5px; border-style: solid; border-color: black; border-width: thin; margin-top: 8px;">
                <table width="100%" cellspacing="0" cellpadding="0">
                  <tr>
                    <td align="left">
                      Last Change: <xsl:value-of select="$lastchange"/>
                    </td>
                    <td align="right">
                      Copyright &#169; 2001-2003 <a href="http://pingus.seul.org/~grumbel/">Ingo Ruhnke</a>, &lt;<a href="mailto:grumbel@gmx.de">grumbel@gmx.de</a>&gt;
                    </td>
                  </tr>
                </table>
              </div>
            </td>
          </tr>
        </table>
      </body>
    </html>
  </xsl:template>
  
  <xsl:template match="section">
    <h2 id="{@title}"><xsl:value-of select="@title" /></h2>
    <xsl:apply-templates />
  </xsl:template>

  <xsl:template match="subsection">
    <h3><xsl:value-of select="@title" /></h3>
    <xsl:apply-templates />
  </xsl:template>
  
  <xsl:template match="screenshots">
    <table summary="" width="100%" border="0" cellpadding="0"  cellspacing="0">
      
      <tr>
        <td align="center">
          <xsl:apply-templates select="item[1]"/>
        </td>
        <td align="center">
          <xsl:apply-templates select="item[2]"/>
        </td>
        <td align="center">
          <xsl:apply-templates select="item[3]"/>
        </td>
      </tr>

      <xsl:if test="count(item)>3">
        <tr>
          <td align="center">
            <xsl:apply-templates select="item[4]"/>
          </td>
          <td align="center">
            <xsl:apply-templates select="item[5]"/>
          </td>
          <td align="center">
            <xsl:apply-templates select="item[6]"/>
          </td>
        </tr>
      </xsl:if>


      <xsl:if test="count(item)>6">
        <tr>
          <td align="center">
            <xsl:apply-templates select="item[7]"/>
          </td>
          <td align="center">
            <xsl:apply-templates select="item[8]"/>
          </td>
          <td align="center">
            <xsl:apply-templates select="item[9]"/>
          </td>
        </tr>
      </xsl:if>

    </table>
  </xsl:template>

  <xsl:template match="screenshots/item">
    <a href="images/{@file}.jpg"><img class="screenshot" alt="{@file}" src="images/{@file}_small.jpg" title="{.}"/></a>
  </xsl:template>

  <xsl:template match="screenshot-menu">
    <p style="text-align: center;">
      [ 
      <a href="screenshots.html">0.2</a>
      |
      <a href="screenshots-0.1.html">0.1</a>
      |
      <a href="screenshots-0.0.html">0.0</a>
      ]
    </p>
  </xsl:template>

  <xsl:template match="section-toc">
    <ul>
      <xsl:for-each select="section">
        <li><a href="#section{generate-id(.)}">
            <xsl:apply-templates/></a></li>
      </xsl:for-each>
    </ul>
    <hr/>
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="faq-list">
    <ul>
      <xsl:for-each select="faq/question">
        <li><a href="#faq{generate-id(.)}">
            <xsl:apply-templates/></a></li>
      </xsl:for-each>
    </ul>
    <hr/>
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="faq">
    <p></p>
    <table width="100%"  class="question">
      <colgroup width="60%" />
      <tr><td valign="top">
          <div id="faq{generate-id(question)}">
            <xsl:apply-templates select="question/node()"/>
          </div>
        </td>
        
        
        <td align="right" valign="top">
          <small>Last update:<xsl:value-of select="@date"/></small>
          [<small><a href="#faqtoc">Up</a></small>]
        </td>
      </tr>
    </table>

    <p class="answer"><xsl:apply-templates select="answer/node()"/> </p>
  </xsl:template>

  <xsl:template match="news">
    <table border="0" width="100%" cellpadding="5" cellspacing="5">
      <colgroup width="*"/>
      <xsl:apply-templates/>
    </table>
  </xsl:template>

  <xsl:template match="news/item">
    <tr>
      <td style="border-style: solid; border-width: thin; white-space: nowrap;" align="right"><tt><xsl:value-of select="@date"/></tt></td>
      <td style="background-color: rgb(180,180,180); color: black;"><xsl:apply-templates/></td>
    </tr>
  </xsl:template>

  <xsl:template match="german-flag">
    (german)
  </xsl:template>

  <xsl:template match="english-flag">
    (english)
  </xsl:template>

  <xsl:template match="dutch-flag">
    (dutch)
  </xsl:template>

  <xsl:template match="thumbnail-link">
    <a href="{@href}"><img 
        class="screenshot" 
        src="{substring-before(@href, '.jpg')}_small.jpg"
        alt="{substring-before(@href, '.jpg')}_small.jpg"/></a>
  </xsl:template>
</xsl:stylesheet>
