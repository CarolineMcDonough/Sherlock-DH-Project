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
    
    <!-- ================================================================ -->
    <!-- Stylesheet variables                                             -->
    <!-- ================================================================ -->
    
    <xsl:variable name="max_height" as="xs:double" select="500"/>
    <xsl:variable name="spacing" as="xs:double" select="100"/>
    <xsl:variable name="barWidth" select="65" as="xs:integer"/>
    <xsl:variable name="interbarSpacing" select="$barWidth div 2" as="xs:double"/>
    <xsl:variable name="max_width" as="xs:double" select="($barWidth + $interbarSpacing) * 3 + $interbarSpacing"/>
    
    <!-- ================================================================ -->
    <!-- Variables that Count Actions                                     -->
    <!-- ================================================================ -->
    <xsl:variable name="action_count_female" as="xs:double" select="//span[@class = female]"/>
    <xsl:variable name="action_count_male" as="xs:double" select="//span[@class = male]"/>
</xsl:stylesheet>