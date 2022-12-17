<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" 
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="#all"
    xmlns="http://www.w3.org/2000/svg" version="3.0">
    
    
        <xsl:output method="xhtml" html-version="5" omit-xml-declaration="yes" 
            include-content-type="no" indent="yes"/>
             <xsl:strip-space elements="story"/>
    
    <xsl:variable name="story_collection" as="document-node()+" select="collection('markup/?select=*.xml')"/>
    
    <xsl:variable name="max_height" as="xs:double" select="500"/>
    <xsl:variable name="spacing" as="xs:double" select="100"/>
    <xsl:variable name="barWidth" select="65" as="xs:integer"/>
    <xsl:variable name="interbarSpacing" select="$barWidth div 2" as="xs:double"/>
    <xsl:variable name="max_width" as="xs:double" select="($barWidth + $interbarSpacing) * 3 + $interbarSpacing"/>



<xsl:template match="story/p">
    <xsl:variable name="femaleCount" as="xs:double" select="(count(//action/char[@gender = 'female']))"/>
    <xsl:variable name="maleCount" as="xs:double" select="(count(//action/char[@gender = 'male']))"/>
    
</xsl:template>
    
    <xsl:template match="/">
        <xsl:value-of select="string-length(normalize-space($femaleCount))-string-length(translate(normalize-space($femaleCount),' ','')) +1"/>
        <xsl:value-of select="string-length(normalize-space($maleCount))-string-length(translate(normalize-space($maleCount),' ','')) +1"/>    
            <svg>
                
            </svg>
        
    </xsl:template>
    
    
    
    
    
    
</xsl:stylesheet>