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
    <xsl:variable name="maleCharCount" as="xs:double" select="count(//span [@class eq 'male'])"/> 
    <xsl:variable name="femaleCharCount" as="xs:double" select="12"/>
    
    <xsl:variable name="femaleActionCount" as="xs:double" select="(count(//action/char[@gender = 'female']))"/>
    <xsl:variable name="maleActionCount" as="xs:double" select="(count(//action/char[@gender = 'male']))"/>
  
    <xsl:variable name="femaleCount" as="xs:double" select="($femaleActionCount div 12)"/>
    <xsl:variable name="maleCount" as="xs:double" select="($maleActionCount div $maleCharCount)"/>
  
    <xsl:template match="/">
        <!--SVG body for bar graph -->
        <svg height="{$max-height + 100} " width="{$max-width + 200}" viewBox="-50, -{$max-height + 50}, {$max-width + 50}, {$max-height + 100}">
            
            <rect x="{$bar-spacing}" y="-{$maleCount}" width="{$bar-width}" height="{$maleCount}" fill="midnightBlue" stroke-width="3"/>
            <text x="{2 * $bar-spacing}" y="20" text-anchor="middle">
                Average Male Actions
            </text>
            
            <rect x="{(2 * $bar-spacing) + $bar-width}" y="-{$femaleCount}" width="{$bar-width}" height="{$femaleCount}" fill="rebeccaPurple" stroke-width="3"/>
            <text x="{(3 * $bar-spacing) + $bar-width}" y="20" text-anchor="middle">
               Average Female Actions
            </text>   
            
            <text x="{(3 * $bar-spacing) + $bar-width}" y="-510" text-anchor="middle" font-size="25">
                Total Actions by Gender
            </text>
            
            <line x1="0" y1="0" x2="{$max-width + $bar-spacing}" y2="0" stroke="black" stroke-width="5" stroke-linecap="square"/>
            <line x1="0" y1="0" x2="0" y2="-{$max-height}" stroke="black" stroke-width="5" stroke-linecap="square"/>
            <text x="-40" y="-{$max-height div 2}" text-anchor="middle" transform="rotate(-90, -70, -{$max-height div 2})">
                Number of Actions
            </text>
            <text x="-30" y="-{$max-height - ($max-height div 60)}" text-anchor="middle">500</text>
            <text x="-30" y="-{$max-height * 0.75}" text-anchor="middle">375</text>
            <text x="-30" y="-{$max-height div 2}" text-anchor="middle">250</text>
            <text x="-30" y="-{$max-height * 0.25}" text-anchor="middle">125</text>
            <text x="-30" y="0">0</text>
        </svg>
    </xsl:template>
</xsl:stylesheet>

    
    
    
    
