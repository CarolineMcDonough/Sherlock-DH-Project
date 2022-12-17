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
    
    <!-- ================================================================ -->
    <!-- Stylesheet variables                                             -->
    <!-- ================================================================ -->
    
    <xsl:variable name="bar-width" as="xs:double" select="150"/>
    <xsl:variable name="bar-spacing" as="xs:double" select="$bar-width div 2"/>
    <xsl:variable name="max-width" as="xs:double" select="($bar-width + $bar-spacing) * 3"/>
    <xsl:variable name="y-scale" as="xs:double" select="5"/>
    <xsl:variable name="max-height" as="xs:double" select="$y-scale * 100"/>
    <!-- ================================================================ -->
    <!-- Variables that Count Actions                                     -->
    <!-- ================================================================ -->
    <xsl:variable name="action_count_female" as="xs:double" select="count(//span [@class eq 'female'])"/> <!-- Should eq 24 -->
    <xsl:variable name="action_count_male" as="xs:double" select="count(//span [@class eq 'male'])"/> <!-- Should eq 85 -->
    <xsl:variable name="action_count_sw" as="xs:double" select="count(//span [@class eq 'sw-action'])"/> <!-- Should eq 42 -->
    
    
    <xsl:template match="/">
        <svg height="{$max-height + 100} " width="{$max-width + 200}" viewBox="-50, -{$max-height + 50}, {$max-width + 50}, {$max-height + 100}">
            
            <!-- MALE BAR -->
            <rect x="{$bar-spacing}" y="-{$action_count_male}" width="{$bar-width}" height="{$action_count_male}" fill="midnightBlue" stroke-width="3"/>
            <text x="{2 * $bar-spacing}" y="20" text-anchor="middle">
                Male Actions
            </text>
            
            <!-- FEMALE BAR -->
            <rect x="{(2 * $bar-spacing) + $bar-width}" y="-{$action_count_female}" width="{$bar-width}" height="{$action_count_female}" fill="rebeccaPurple" stroke-width="3"/>
            <text x="{(3 * $bar-spacing) + $bar-width}" y="20" text-anchor="middle">
                Female Actions
            </text>
            
            <!-- Holmes and Watson BAR -->
            <rect x="{(3 * $bar-spacing) + (2 * $bar-width)}" y="-{$action_count_sw}" width="{$bar-width}" height="{$action_count_sw}" fill="fireBrick" stroke-width="3"/>
            <text x="{(4 * $bar-spacing) + (2 * $bar-width)}" y="20" text-anchor="middle">
                Holmes/Watson Actions
            </text>
            
            <!-- ================================================================ -->
            <!-- Axes and their Labels                                            -->
            <!-- ================================================================ -->
            
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