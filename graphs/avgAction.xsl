<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    xpath-default-namespace="http://www.w3.org/1999/xhtml"
    xmlns="http://www.w3.org/2000/svg"
    exclude-result-prefixes="#all"
    version="3.0">
    
    <xsl:output method="xhtml" html-version="5" omit-xml-declaration="no" 
        include-content-type="no" indent="yes"/>
    
    <!--searches our entire story collection-->
    <xsl:variable name="story_collection" as="document-node()+" select="collection('markup/?select=*.xml')"/>
    
    <!--establishes stylesheet attributes-->
    <xsl:variable name="bar-width" as="xs:double" select="150"/>
    <xsl:variable name="bar-spacing" as="xs:double" select="$bar-width div 2"/>
    <xsl:variable name="max-width" as="xs:double" select="($bar-width + $bar-spacing) * 3"/>
    <xsl:variable name="y-scale" as="xs:double" select="5"/>
    <xsl:variable name="max-height" as="xs:double" select="$y-scale * 100"/>
    
    <!--count elements for char and action count per gender-->
    <xsl:variable name="actionCountFemale" as="xs:double" select="(sum(//action/char[@gender = 'female']))"/> 
    <xsl:variable name="actionCountMale" as="xs:double" select="(sum(//action/char[@gender = 'male']))"/> 
    <xsl:variable name="charCountMale" as="xs:double" select="(count(//action/char[@gender = 'male']))"/>
    
    <!---->
    
    <xsl:variable name="femaleCount" as="xs:double" select= "($actionCountFemale div 12)"/>
    <xsl:variable name="maleCount" as="xs:double" select="($actionCountMale div $charCountMale)"/>

    <xsl:template match="/">
        
        
        <svg xmlns="http://www.w3.org/2000/svg" height="600 " width="875" viewBox="-50, -550, 725, 600">
          
            <rect x="75" y="-{$maleCount}" width="150" height="{$maleCount}" fill="midnightBlue" stroke-width="3"/>
            <text x="150" y="20" text-anchor="middle">
                Average actions/male
            </text>
            
            <rect x="75" y="-{$femaleCount}" width="150" height="{$femaleCount}" fill="rebeccaPurple" stroke-width="3"/>
            <text x="150" y="20" text-anchor="middle">
                Average actions/female
            </text>
           
        <text x="-30" y="-491.6666666666667" text-anchor="middle">10</text>
        <text x="-30" y="-375" text-anchor="middle">6</text>
        <text x="-30" y="-250" text-anchor="middle">4</text>
        <text x="-30" y="-125" text-anchor="middle">2</text>
        <text x="-30" y="0">0</text></svg>
    </xsl:template>
</xsl:stylesheet>

    
    
    
    
