<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    
    xmlns="http://www.w3.org/1999/xhtml"
    exclude-result-prefixes="#all"
    version="3.0">
    <!-- NO NAMESPACE FOR INPUT -->
    
    <xsl:output method="xhtml" html-version="5" omit-xml-declaration="yes" 
        include-content-type="no" indent="yes"/>
    
    
    
    <!-- ========================================================================================== -->
    <!-- Variable that selects all of the stories -->
    <xsl:variable name="story_collection" as="document-node()+" select="collection('markup/?select=*.xml')"/>
    <!-- ========================================================================================== -->
    
    <!-- ================================================================ -->
    <!-- Stylesheet variables                                             -->
    <!-- ================================================================ -->
    
    <xsl:variable name="max_height" as="xs:double" select="500"/>
    <xsl:variable name="spacing" as="xs:double" select="100"/>
    <xsl:variable name="barWidth" select="65" as="xs:integer"/>
    <xsl:variable name="interbarSpacing" select="$barWidth div 2" as="xs:double"/>
    <xsl:variable name="max_width" as="xs:double" select="($barWidth + $interbarSpacing) * 3 + $interbarSpacing"/>
    <!-- Variable containing ALL KNOWN FEMALE SPEAKERS FROM THE TEXTS -->
    <xsl:variable name="female-characters" select="'ireneAdler, randomWoman, elderlyWoman, marySutherland, maggieRyder, helenStoner, juliaStoner, maryHolder, maryWatson, kateWhitney, mrsStClair, unknownWoman, '"/>
    <!-- Variable for just Holmes and Watson, to keep them separate from the rest of the non-main characters -->
    <xsl:variable name="holmes-and-watson" select="'sherlockHolmes, johnWatson'"/>
    <!-- ================================================================== -->
    <!-- Wordcount Variables                                                    -->
    <!-- ================================================================== -->
    <xsl:variable name="femaleWordcount" as="xs:double" select="$story_collection//quote[contains($female-characters, @speaker)]"/>
    <xsl:variable name="maleWordcount" as="xs:double" select="$story_collection//quote[not(contains($holmes-and-watson, @speaker)) and not(contains($female-characters, @speaker))]"/>

    <xsl:variable name="shWordcount" as="xs:double" select=".  $story_collection//quote[contains($holmes-and-watson, @speaker)]"/>
    
   
    
    
    <!-- ================================================================== -->
    <!-- SVG                                                                -->
    <!-- ================================================================== -->
    <xsl:template match="/">
        
        <xsl:value-of select="string-length(normalize-space($femaleWordcount))-string-length(translate(normalize-space($femaleWordcount),' ','')) +1"/>
        
        <svg height="{$max_height + 100} " width="{$max_width + 200}" viewBox="-50, -{$max_height + 50}, {$max_width + 50}, {$max_height + 100}">
        
        </svg>
    </xsl:template>
        
        
    
    
    
    
    
    
    
    
    
    
    
</xsl:stylesheet>