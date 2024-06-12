<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:t="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.w3.org/1999/xhtml" 
    exclude-result-prefixes="t"
    version="1.0">

<xsl:include href="./teip5toms.xsl"/>  

<xsl:template match="t:front">
.TL
<xsl:for-each select="t:docTitle/t:titlePart" >
<xsl:for-each select="t:title">
<xsl:apply-templates/><xsl:if test="position() &lt; last()"><xsl:text>
.br  
</xsl:text></xsl:if></xsl:for-each>
</xsl:for-each>
.AB no
.AE
</xsl:template>

<xsl:template match="t:note"/>

  
</xsl:stylesheet>
