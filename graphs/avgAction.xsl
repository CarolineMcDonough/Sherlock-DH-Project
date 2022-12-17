<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math" exclude-result-prefixes="#all"
    xmlns="http://www.w3.org/2000/svg" version="3.0">
    <xsl:output method="xml" indent="yes"/>
    
    <xsl:variable name="story_collection" as="document-node()+" select="collection('markup/?select=*.xml')"/>
    
    <xsl:variable name="bar-width" as="xs:double" select="150"/>
    <xsl:variable name="bar-spacing" as="xs:double" select="$bar-width div 2"/>
    <xsl:variable name="max-width" as="xs:double" select="($bar-width + $bar-spacing) * 3"/>
    <xsl:variable name="y-scale" as="xs:double" select="5"/>
    <xsl:variable name="max-height" as="xs:double" select="$y-scale * 100"/>
    
    <xsl:variable name="femaleCharCount" as="xs:double" select="count(//span [@class eq 'female'])"/> 
    <xsl:variable name="maleCharCount" as="xs:double" select="count(//span [@class eq 'male'])"/> 
    
    
    <xsl:variable name="femaleActionCount" as="xs:double" select="(count(//action/char[@gender = 'female']))"/>
    <xsl:variable name="maleActionCount" as="xs:double" select="(count(//action/char[@gender = 'male']))"/>
  
    <xsl:template match="/">
        
        <svg height="{$max-height + 100} " width="{$max-width + 200}" viewBox="-50, -{$max-height + 50}, {$max-width + 50}, {$max-height + 100}">
            <line x1="0" y1="0" x2="{$max-width}" y2="0" stroke="black" stroke-width="5" stroke-linecap="square"/>
            <line x1="0" y1="0" x2="0" y2="-{$max-height}" stroke="black" stroke-width="5" stroke-linecap="square"/>
            
            <rect x="{(2 * $bar-spacing) + $bar-width}" y="-{$femaleActionCount / $femaleCharCount}" width="{$bar-width}" height="{$femaleActionCount / $femaleCharCount}" fill="rebeccaPurple" stroke-width="3"/>
            <text x="{(3 * $bar-spacing) + $bar-width}" y="20" text-anchor="middle">
                Average Action Count per Female
            </text>
            
            <rect x="{(2 * $bar-spacing) + $bar-width}" y="-{$maleActionCount / $maleCharCount}" width="{$bar-width}" height="{$maleActionCount / $maleCharCount}" fill="midnightBlue" stroke-width="3"/>
            <text x="{(3 * $bar-spacing) + $bar-width}" y="20" text-anchor="middle">
                Average Action Count per Male
            </text>
        </svg>
    </xsl:template>
</xsl:stylesheet>

    
    
    
    
