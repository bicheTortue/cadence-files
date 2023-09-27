<?xml version="1.0" encoding="ISO-8859-1"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
  <html>
    <head>
    <link type="text/css" rel="stylesheet" 
          href="traverse.css" />
    <script type="text/javascript" src="traverse_frames.js">
    </script>
    </head>
  <body onload='//collapseAll();'>
  <xsl:apply-templates/>
  </body>
  </html>
</xsl:template>

<xsl:template match="gen_date">
<!-- skip gen_date entirely within the preview frame -->
</xsl:template>


<xsl:template match="bom">
  <!-- instead of showing the bom, just show a preview header and create a
        placeholder spot for the preview image -->
  <h1>Preview</h1>
  <img id="bigIMG" src="images/barbaLib/truc/schematic/thumbnail_256x256.png" alt="Leaf-Level Cell" height="256" width="256"></img>
</xsl:template>


<xsl:template match="bom_entry">
<!-- skip bom entirely within the preview frame -->
</xsl:template>

<xsl:template match="master_details">
<!-- skip master details entirely within the preview frame -->
</xsl:template>

<xsl:template match="top">
<!-- skip master details entirely within the preview frame -->
</xsl:template>



<xsl:template match="occurrence_tree">
  <xsl:apply-templates select="occ"/>
</xsl:template>


<xsl:template match="occ">
<!-- skip occ tree entirely within the preview frame -->
</xsl:template>

<xsl:template match="indent">
<!-- TODO delete me...indents are not needed -->
</xsl:template>


<xsl:template match="inst">
<!-- skip occ tree entirely within the preview frame -->
</xsl:template>

<xsl:template match="lib">
<!-- skip occ tree entirely within the preview frame -->
</xsl:template>

<xsl:template match="cell">
<!-- skip occ tree entirely within the preview frame -->
</xsl:template>

<xsl:template match="view">
<!-- skip occ tree entirely within the preview frame -->
</xsl:template>


</xsl:stylesheet>
