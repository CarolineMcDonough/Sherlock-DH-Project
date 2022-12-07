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
    
    <!-- =============================================================================================================================================================================================================== -->
    <!-- Variable containing ALL KNOWN FEMALE SPEAKERS FROM THE TEXTS -->
    <xsl:variable name="female-characters" select="'ireneAdler, randomWoman, elderlyWoman, marySutherland, maggieRyder, helenStoner, juliaStoner, maryHolder, maryWatson, kateWhitney, mrsStClair, unknownWoman, '"/>
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
                <h1>Sample of a Reading View</h1>
                <h2><xsl:apply-templates select="passage/title"/></h2>
                <xsl:apply-templates select="passage/story/p"/>
            </body>
        </html>
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
                <q class="female-action">
                    <xsl:apply-templates/>
                </q>
            </xsl:when>
            <xsl:otherwise>
                <q class="male-action">
                    <xsl:apply-templates/>
                </q>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="subq">
        <xsl:choose>
            <xsl:when test="contains($female-characters, @speaker)">
                <q class="female-action">
                    <xsl:apply-templates/>
                </q>
            </xsl:when>
            <xsl:otherwise>
                <q class="male-action">
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
        <span class="{char/@gender}" title="{char/@name}"> 
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    <!-- ========================================================================================== -->
    
</xsl:stylesheet>