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
    
    
    <!-- =============================================================================================================================================================================================================== -->
    <!-- Variable containing ALL KNOWN FEMALE SPEAKERS FROM THE TEXTS -->
    <xsl:variable name="female-characters" select="'ireneAdler, randomWoman, elderlyWoman, marySutherland, maggieRyder, helenStoner, juliaStoner, maryHolder, maryWatson, kateWhitney, mrsStClair, unknownWoman, '"/>
    <!-- Variable for just Holmes and Watson, to keep them separate from the rest of the non-main characters -->
    <xsl:variable name="holmes-and-watson" select="'sherlockHolmes, johnWatson'"/>
    <!-- =============================================================================================================================================================================================================== -->
    
    <!-- ========================================================================================== -->
    <!-- Main document template, may need a bit of tweaking re:headers -->
    <xsl:template match="/">
        <html>
            <head>
                <title>
                    Reading View for Sherlock
                </title>
                <link rel= "stylesheet" type="text/css" href="mcdonough_11-11-22.css"/>
            </head>
            <body>
                <h1><xsl:apply-templates select="$story_collection//passage"/></h1>
                <xsl:apply-templates select="$story_collection//passage/story/p"/>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="passage">
        <xsl:apply-templates select="title"/>
    </xsl:template>


    <!-- ========================================================================================== -->
    <!-- Basic Paragraph Template— 
    1-to-1 translation, then apply templates to all children -->
    <xsl:template match="p">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    <!-- ========================================================================================== -->
    
    
    <!-- ========================================================================================== -->
    <!-- Templates for Quotes and Sub-quotes -->
    <xsl:template match="quote">
        <xsl:choose>
            <xsl:when test="contains($female-characters, @speaker)">
                <q class="female-quote">
                    <xsl:apply-templates/>
                </q>
            </xsl:when>
            <xsl:when test="contains($holmes-and-watson, @speaker)">
                <q class="sw-quote">
                    <xsl:apply-templates/>
                </q>
            </xsl:when>
            <xsl:otherwise>
                <q class="male-quote">
                    <xsl:apply-templates/>
                </q>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="subq">
        <xsl:choose>
            <xsl:when test="contains($female-characters, @speaker)">
                <q class="female-quote">
                    <xsl:apply-templates/>
                </q>
            </xsl:when>
            <xsl:when test="contains($holmes-and-watson, @speaker)">
                <q class="sw-quote">
                    <xsl:apply-templates/>
                </q>
            </xsl:when>
            <xsl:otherwise>
                <q class="male-quote">
                    <xsl:apply-templates/>
                </q>
            </xsl:otherwise>
        </xsl:choose>
        <xsl:if test="following-sibling::subq"><br/></xsl:if>
    </xsl:template>
    <!-- ========================================================================================== -->
    
    
    <!-- ========================================================================================== -->
    <!-- Templates for Actions -->
    <xsl:template match="action">
        <xsl:choose>
            <xsl:when test="char[contains($holmes-and-watson,@name)]">
                <span class="sw-action">
                    <xsl:apply-templates/>
                </span>
            </xsl:when>
            <xsl:otherwise>
                <span class="{char/@gender}" title="{char/@name}"> 
                    <xsl:apply-templates/>
                </span>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <!-- ========================================================================================== -->
    
</xsl:stylesheet>