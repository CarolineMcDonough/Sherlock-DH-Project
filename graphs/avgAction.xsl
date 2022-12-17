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
    <xsl:variable name="femaleCharCount" as="xs:double" select="12"/>
    <xsl:variable name="maleCharCount" as="xs:double" select="count(//span [@class eq 'male'])"/> 
    
    
    <xsl:variable name="femaleActionCount" as="xs:double" select="(count(//action/char[@gender = 'female']))"/>
    <xsl:variable name="maleActionCount" as="xs:double" select="(count(//action/char[@gender = 'male']))"/>
    
    <xsl:variable name="femaleCount" as="xs:double" select="sum($femaleActionCount) div sum($femaleCharCount)"/>
    <xsl:variable name="maleCount" as="xs:double" select="sum($maleActionCount) div sum($maleCharCount)"/>
    
  
    <xsl:template match="/">
        
        
        
        <svg xmlns="http://www.w3.org/2000/svg" height="600 " width="875" viewBox="-50, -550, 725, 600">
            
            <rect x="{(2 * $bar-spacing)}" y="-{$maleCount}" width="{$bar-width}" height="{$maleCount}" fill="midnightBlue" stroke-width="3"/>
            <text x="{2 * $bar-spacing}" y="20" text-anchor="middle">
                Average actions/male
            </text>
            
            <rect x="{(2 * $bar-spacing) + $bar-width}" y="-{$femaleCount}" width="150" height="{$femaleCount}" fill="rebeccaPurple" stroke-width="3"/>
            <text x="{2 * $bar-spacing}" y="20" text-anchor="middle">
                Average actions/female- 2.0
            </text>
     
            <text x="-30" y="-491.6666666666667" text-anchor="middle">500</text>
            <text x="-30" y="-375" text-anchor="middle">375</text>
            <text x="-30" y="-250" text-anchor="middle">250</text>
            <text x="-30" y="-125" text-anchor="middle">125</text>
            <text x="-30" y="0">0</text>
        </svg>
        
       
    </xsl:template>
    
</xsl:stylesheet>

    
    
    
    
