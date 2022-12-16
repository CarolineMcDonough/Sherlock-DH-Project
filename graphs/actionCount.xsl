<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math" exclude-result-prefixes="#all"
    xmlns="http://www.w3.org/2000/svg" version="3.0">
    <xsl:output method="xml" indent="yes"/>
    <!-- ================================================================ -->
    <!-- Stylesheet variables                                             -->
    <!-- ================================================================ -->

    <xsl:variable name="max_height" as="xs:double" select="500"/>
    <xsl:variable name="spacing" as="xs:double" select="100"/>
    <xsl:variable name="barWidth" select="65" as="xs:integer"/>
    <xsl:variable name="interbarSpacing" select="$barWidth div 2" as="xs:double"/>

    <!-- ================================================================== -->
    <!-- SVG                                                                -->
    <!-- ================================================================== -->
    <xsl:template match="/">
        
       
    </xsl:template>
    <xsl:template match="story/p">
        
        <!-- ================================================================== -->
        <!-- Count Variables                                                    -->
        <!-- ================================================================== -->
        <xsl:variable name="femaleCount" as="xs:double" select="(count(//action/char[@gender = 'female']))"/>
        <xsl:variable name="maleCount" as="xs:double" select="(count(//action/char[@gender = 'male']))"/>
        <xsl:variable name="allCount" as="xs:double" select="(count(//action/char[@gender]))"/>
        <!-- Split Sherlock and Watson count variables - just in case individual counts were to be needed-->
        <xsl:variable name="sherCount" as="xs:double" select="(count(//action/char/[@name = 'sherlockHolmes']))"/>
        <xsl:variable name="watsCount" as="xs:double" select="(count(//action/char/[@name = 'johnWatson']))"/>
        
        
        
    </xsl:template>
</xsl:stylesheet>
