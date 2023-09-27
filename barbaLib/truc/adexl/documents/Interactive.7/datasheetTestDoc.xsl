<?xml version="1.0"?>

<!--
 *************************************************************
 * This program is the Confidential and Proprietary product of
 * Cadence Design Systems.  Any unauthorized use, reproduction
 * or transfer of this program is strictly prohibited.
 *
 * Copyright (c) 2006, Cadence Design Systems, Inc.
 * All rights reserved.
 *
 * Purpose: XSL file for test datasheet document.
 *
 *************************************************************
 * $Revision: #1 $
 * $Author: cicinteg $
 *************************************************************
 -->

 <xsl:stylesheet xmlns:xhtml="http://www.w3.org/1999/xhtml" xmlns="http://www.w3.org/1999/xhtml" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
     <xsl:output method="xml" version="1.0" doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
         doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"/>

     <xsl:variable name="yieldResultsCount" select="count(/ROOT/IYRESULTS/IYRESULTITEM)" />
     <xsl:variable name="waveformsCount" select="count(/ROOT/WAVEFORMS/WAVEFORM)" />
     <xsl:key name="specs" match="/ROOT/CORNERSPECS/CORNERSPEC" use="@resultName" />
     <xsl:template match="/ROOT">
         <html lang="en" xmlns="http://www.w3.org/1999/xhtml">
             <head>
                 <title>Data Sheet</title>
                 <link rel="stylesheet" type="text/css" href="datasheet.css" />
             </head>
             <body>
                 <xsl:variable name="resultsSummaryAvailable" select="count(descendant::RESULTSSUMMARY)" />
                 <xsl:variable name="IYResultsAvailable" select="count(descendant::IYRESULTS)" />
                 <xsl:variable name="detailedResultsAvailable" select="count(descendant::RESULTS)" />
                 <xsl:variable name="waveformsAvailable" select="count(descendant::WAVEFORMS)" />
                 <p />

                 <xsl:variable name="mainfnameprefixvar" select="/ROOT/@mainfnameprefix" />

                 <a href="{$mainfnameprefixvar}.xml"><h6 class="text-right">Go to Main Datasheet Page</h6></a>
                 <a name="pageTop"><h1>Test <xsl:value-of select="@name" /> </h1></a>
                 <p />
                 <h2>Source and Contents </h2>
                 <p />
		The run mode is: <xsl:value-of select="@runMode" />.
		<p />
		<xsl:if test="@parasiticsRunMode != 'None'">
			Parasitics run mode : <xsl:value-of select="@parasiticsRunMode" />.
		</xsl:if>

                 <p />
                 <ul>

                     <xsl:if test="$resultsSummaryAvailable = 1">
                         <li><a href="#ResultsSummary">Results Summary</a></li>
                     </xsl:if>
                     <xsl:if test="$IYResultsAvailable = 1">
                         <li><a href="#IYResults">Yield Results</a></li>
                     </xsl:if>
                     <xsl:if test="$detailedResultsAvailable = 1">
                         <li><a href="#DetailedResults">Detailed Results</a></li>
                     </xsl:if>
                     <xsl:if test="$waveformsAvailable = 1">
                         <li><a href="#Waveforms">Waveforms</a></li>
                     </xsl:if>
                 </ul>
                 <p />
                 <xsl:apply-templates select="RESULTSSUMMARY" />
                 <p />
                 <xsl:apply-templates select="IYRESULTS" />
                 <p />
                 <xsl:apply-templates select="RESULTS" />
                 <p />
                 NOTE: An asterisk (*) before a result value indicates that the value has been evaluated on partial simulation data. 
                 <p />
                 <xsl:apply-templates select="WAVEFORMS" />
                 <a href="#pageTop"><h6 class="text-right"> ^Top </h6></a>
                 <p>
                     <br/>
		Datasheet created on <xsl:value-of select="@dsCreationDateTime" />
                     <xsl:if test="@dsAuthorName != ''"> by <xsl:value-of select="@dsAuthorName" /> <xsl:if test="@dsUserName != ''"> (<xsl:value-of select="@dsUserName" />) </xsl:if> </xsl:if>
                     <br/>
                 </p>

             </body>
         </html>
     </xsl:template>

     <xsl:template match="RESULTSSUMMARY">
         <a href="#pageTop"><h6 class="text-right"> ^Top </h6></a>
         <a name="ResultsSummary"><h1>Results Summary</h1></a>
         <br/>
         <table>
             <tr>
                 <th>Test</th>
                 <th>Calculation</th>
                 <th>Expression</th>
                 <th>Target</th>
                 <th>Minimum Value</th>
                 <th>Maximum Value</th>
                 <xsl:for-each select="/ROOT/RESULTSSUMMARY/RSCOLNAME">
                     <th><xsl:value-of select="@colName"/></th>
                 </xsl:for-each>
             </tr>
             <xsl:for-each select="RSITEM">
                 <xsl:variable name="pass_percentage">
                     <xsl:call-template name = "calc_pass_percentage">
                         <xsl:with-param name = "resName" ><xsl:value-of select="@resultName"/></xsl:with-param>
                     </xsl:call-template>
                 </xsl:variable>
                 <tr class="row{position() mod 2}">
                     <td><xsl:value-of select="@test" /></td>
                     <td><xsl:value-of select="@resultName" /></td>
                     <xsl:choose>
                         <xsl:when test="@expType = 'ocean'">
                             <td><a href="{@expName}"><xsl:value-of select="@expName" /></a></td>
                         </xsl:when>
                         <xsl:otherwise>
                             <td><xsl:value-of select="@expName" /></td>
                         </xsl:otherwise>
                     </xsl:choose>

                     <xsl:variable name="opName" select="@resultName" />
                     <xsl:variable name="specCountForResult" select="count(./../../CORNERSPECS/CORNERSPEC[@resultName = $opName])" />
                     <xsl:choose>
                         <xsl:when test="$specCountForResult > 1">
                             <td><xsl:text>Various</xsl:text><br/><xsl:text>Nominal : </xsl:text><xsl:value-of select="./../../CORNERSPECS/CORNERSPEC[@resultName = $opName and @cornerName = 'Nominal']/@specdesc" /></td>
                         </xsl:when>
                         <xsl:otherwise>
                             <td><xsl:value-of select="@specdesc" /></td>
                         </xsl:otherwise>
                     </xsl:choose>

                     <td class="{@min_status}-color"><xsl:value-of select="@minVal" /></td>
                     <td class="{@max_status}-color"><xsl:value-of select="@maxVal" /></td>
                     <xsl:for-each select="/ROOT/RESULTSSUMMARY/RSCOLNAME">
                         <xsl:variable name="colName">  <xsl:value-of select="@colName"/></xsl:variable>
                         <xsl:for-each select="/ROOT/RESULTSSUMMARY/RSCOLINFO">
                             <xsl:if test="$colName = @colName">
                                 <xsl:if test="$opName = @resultName">
                                     <td><xsl:value-of select="@colValue" /></td>
                                 </xsl:if>
                             </xsl:if>
                         </xsl:for-each>
                     </xsl:for-each>
                 </tr>

             </xsl:for-each>
         </table>
         <br/>
     </xsl:template>

     <xsl:template match="IYRESULTS">
         <xsl:variable name="confidencePercentileValue" select="IYMATE/@IYconfidencePercentile" />
         <xsl:variable name="errorFilterSettingStr" select="IYMATE/@IYerrorFilterSetting" />
         <a href="#pageTop"><h6 class="text-right"> ^Top </h6></a>
         <a name="IYResults"><h1>Yield Results</h1></a>
         <xsl:choose>
             <xsl:when test="$yieldResultsCount=0">
                 <ul><li><u>Yield Results Not Available</u></li></ul>
             </xsl:when>
             <xsl:otherwise>
                 <xsl:if test="$confidencePercentileValue!=0">
                     <xsl:text>Confidence Level:</xsl:text><xsl:value-of select="$confidencePercentileValue" /><xsl:text>%</xsl:text>
                 </xsl:if>
                 <xsl:if test="$errorFilterSettingStr!=''">
                     <xsl:text>Error filter: </xsl:text><xsl:value-of select="$errorFilterSettingStr" />
                 </xsl:if>
                 <br/>
                 <table>
                     <tr>
                         <th>Test</th>
                         <th>Name</th>
                         <th>Yield</th>
                         <th>Min</th>
                         <th>Target</th>
                         <th>Max</th>
                         <th>Mean</th>
                         <th>Sigma</th>
                         <th>Sigma To Target</th>
                         <th>Cpk</th>
                         <xsl:for-each select="/ROOT">
                             <xsl:if test="@enableCpkPerc = 'enable'">
                                 <th>Cpk(Use Median and Percentile)</th>
                             </xsl:if>
                         </xsl:for-each>
                         <th>Number Of Errors</th>
                     </tr>
                     <xsl:for-each select="IYRESULTITEM">
                         <tr class="row{position() mod 2}">
                             <td><xsl:value-of select="@testName" /></td>
                             <td><xsl:value-of select="@name" /></td>
                             <td><xsl:value-of select="@yield" /></td>
                             <td><xsl:value-of select="@min" /></td>
                             <td><xsl:value-of select="@target" /></td>
                             <td><xsl:value-of select="@max" /></td>
                             <td><xsl:value-of select="@mean" /></td>
                             <td><xsl:value-of select="@sigma" /></td>
                             <td><xsl:value-of select="@targetSigma" /></td>
                             <td><xsl:value-of select="@cpkCalcBySigma" /></td>
                             <xsl:if test="@enableCpkPerc = 'enable'">
                                 <td><xsl:value-of select="@cpkCalcByPercentile" /></td>
                             </xsl:if>
                             <td><xsl:value-of select="@errCount" /></td>
                         </tr>
                     </xsl:for-each>
                     <tr class="rowSubHeader">
                         <td>Estimated Yield</td>
                         <td colspan="11"><xsl:value-of select="IYESTIMATE/@estimated_yield" /><xsl:text>% (</xsl:text><xsl:value-of select="IYESTIMATE/@estimated_yield_passed_count" /><xsl:text>/</xsl:text><xsl:value-of select="IYESTIMATE/@estimated_yield_point_count" /><xsl:text>), </xsl:text><xsl:value-of select="IYESTIMATE/@estimated_yield_errorPoint_count" /><xsl:text> errors</xsl:text></td>
                     </tr>
                     <tr class="rowSubHeader">
                         <td>Estimated Yield (No opregions)</td>
                         <td colspan="11"><xsl:value-of select="IYESTIMATE/@estimated_yield_noOpRegions" /><xsl:text>% (</xsl:text><xsl:value-of select="IYESTIMATE/@estimated_yield_noOpRegions_passed_count" /><xsl:text>/</xsl:text><xsl:value-of select="IYESTIMATE/@estimated_yield_noOpRegions_point_count" /><xsl:text>)</xsl:text></td>
                     </tr>
                 </table>

                 <br/>
             </xsl:otherwise>
         </xsl:choose>
     </xsl:template>

     <xsl:template match="RESULTS">
         <p />
         <a href="#pageTop"><h6 class="text-right"> ^Top </h6></a>
         <a name="DetailedResults"><h1>Detailed Results </h1></a>
         <p />
         <p />

         <xsl:for-each select="TESTOUTPUTS/TESTOUTPUT">
             <xsl:variable name="ipCnt">  <xsl:value-of select="count(../../INPUTPARAMS/INPUTPARAM)"/></xsl:variable>
             <xsl:variable name="opCnt">  <xsl:value-of select="count(./OUTPUTPARAMS/OUTPUTPARAM)"/></xsl:variable>
             <xsl:variable name="modelFileParamId">    <xsl:value-of select="../../INPUTPARAMS/INPUTPARAM[@name = 'corModelSpec']/@id" /></xsl:variable>

             <xsl:variable name="uniqueSpecResultCount" select="count(./../../../CORNERSPECS/CORNERSPEC[generate-id() = generate-id(key('specs', @resultName))]/@resultName)" />

             <table>
                 <tr>
                     <th></th>
                     <th colspan="{$ipCnt}">Conditions</th>
                     <th colspan="{$opCnt + $uniqueSpecResultCount}">Outputs</th>
                 </tr>
                 <tr class="rowSubHeader">
                     <td class="rowSubHeader">Corner</td>
                     <xsl:for-each select="../../INPUTPARAMS/INPUTPARAM">
                         <td class="rowSubHeader">
                             <xsl:choose>
                                 <xsl:when test="contains(@name,'/')">
                                     <xsl:value-of select="substring-before(@name,'/')" />
                                     <br />
                                     <xsl:value-of select="substring-before(substring-after(@name,'/'), '/')" />
                                     <br />
                                     <xsl:value-of select="substring-before(substring-after(substring-after(@name,'/'), '/'),'/')" />
                                     <br />
                                     <xsl:value-of select="substring-after(substring-after(substring-after(@name,'/'), '/'),'/')" />
                                 </xsl:when>
                                 <xsl:when test="contains(@name,'corModelSpec')">
                                     <xsl:text>Model Specification</xsl:text>
                                 </xsl:when>
                                 <xsl:otherwise>
                                     <xsl:call-template name="text_wrapper">
                                         <xsl:with-param name="Text" ><xsl:value-of select="@name" /></xsl:with-param>
                                     </xsl:call-template>
                                 </xsl:otherwise>
                             </xsl:choose>
                         </td>
                     </xsl:for-each>
                     <xsl:for-each select="OUTPUTPARAMS/OUTPUTPARAM">
                         <xsl:variable name="opName" select="@name" />
                         <xsl:variable name="specCountForResult" select="count(./../../../../../CORNERSPECS/CORNERSPEC[@resultName = $opName])" />
			 <xsl:variable name="specVaries" select="./../../../../../CORNERSPECS/CORNERSPEC[@resultName = $opName and @cornerName = 'Nominal']/@varyingSpec" />

                         <xsl:choose>
                             <xsl:when test="$specCountForResult > 1 or $specVaries='true'">
                                 <td colspan="2"><xsl:value-of select="@name" /></td>
                             </xsl:when>
                             <xsl:otherwise>
                                 <td colspan="1"><xsl:value-of select="@name" /></td>
                             </xsl:otherwise>
                         </xsl:choose>

                     </xsl:for-each>
                 </tr>

                 <tr class="rowSubHeader">

                     <td colspan="{$ipCnt + 1}"></td>
                     <xsl:for-each select="OUTPUTPARAMS/OUTPUTPARAM">
                         <xsl:variable name="opName" select="@name" />
                         <xsl:variable name="specCountForResult" select="count(./../../../../../CORNERSPECS/CORNERSPEC[@resultName = $opName])" />
						 <xsl:variable name="specVaries" select="./../../../../../CORNERSPECS/CORNERSPEC[@resultName = $opName and @cornerName = 'Nominal']/@varyingSpec" />
                         <xsl:choose>
                             <xsl:when test="$specCountForResult >= 1 or $specVaries = 'true'">
                                 <td>Value</td>
                                 <td>Target</td>
                             </xsl:when>
                             <xsl:otherwise>
                                 <td>Value</td>
                             </xsl:otherwise>
                         </xsl:choose>

                     </xsl:for-each>


                 </tr>

                 <xsl:variable name="testId">  <xsl:value-of select="@id"/></xsl:variable>
                 <xsl:for-each select="../../INPUTPARAMS/INPUTPARAM[1]/DESIGNPOINT">
                     <tr class="rowSubHeader">
                         <td colspan="{$ipCnt + $opCnt * 2 + $uniqueSpecResultCount}"> <xsl:text> Design Point </xsl:text><xsl:value-of select="@dpId" /></td>
                     </tr>
                     <xsl:variable name="designPointId"><xsl:value-of select="@dpId"/></xsl:variable>
                     <xsl:for-each select="VALUE">
                         <xsl:variable name="pointId"> <xsl:value-of select="@pid"/></xsl:variable>
                         <tr class="row{position() mod 2}">
                             <td><xsl:value-of select="@corner" /></td>
                             <xsl:for-each select="../../../../INPUTPARAMS/INPUTPARAM/DESIGNPOINT[@dpId = $designPointId]">
                                 <xsl:choose>
                                     <xsl:when test="../@id = $modelFileParamId">
                                         <xsl:variable name="modelFileData"><xsl:value-of select="./VALUE[@pid = $pointId]/." />
                                         </xsl:variable>
                                         <td>
                                             <xsl:for-each select="./VALUE[@pid = $pointId]/MODELFILE">
                                                 <xsl:variable name="modelFileName">
                                                     <xsl:call-template name = "substring-after-last" >
                                                         <xsl:with-param name = "input" ><xsl:value-of select="./@file" /></xsl:with-param>
                                                         <xsl:with-param name = "marker" >/</xsl:with-param>
                                                     </xsl:call-template>
                                                 </xsl:variable>
                                                 <xsl:value-of select="$modelFileName"/><xsl:text>&#x20;</xsl:text><xsl:value-of select="@section" /><br/>

                                             </xsl:for-each>
                                         </td>
                                     </xsl:when>
                                     <xsl:otherwise>
                                         <td><xsl:value-of select="./VALUE[@pid = $pointId]/." /></td>
                                     </xsl:otherwise>
                                 </xsl:choose>
                             </xsl:for-each>
                             <xsl:for-each select="../../../../TESTOUTPUTS/TESTOUTPUT[@id = $testId]/OUTPUTPARAMS/OUTPUTPARAM">
                                 <xsl:variable name="dpNum">  <xsl:value-of select="count(./DESIGNPOINT[@dpId = $designPointId])"/></xsl:variable>
                                 <xsl:choose>
                                     <xsl:when test=" $dpNum = 0">
                                         <td></td>
                                     </xsl:when>
                                     <xsl:otherwise>
                                         <xsl:for-each select="./DESIGNPOINT[@dpId = $designPointId]">
                                             <xsl:variable name="pIdNum">  <xsl:value-of select="count(./VALUE[@pid = $pointId])"/></xsl:variable>
                                             <xsl:choose>
                                                 <xsl:when test=" $pIdNum = 0">
                                                     <td></td>
                                                     <xsl:variable name="opName" select="../@name" />
                                                     <xsl:variable name="targetVal" select="./../../../../../../CORNERSPECS/CORNERSPEC[@resultName = $opName and @cornerName = 'Nominal']/@specdesc" />
                                                     <xsl:choose>
                                                         <xsl:when test="$targetVal != 'spec disabled'">
                                                             <td></td>
                                                         </xsl:when>
                                                     </xsl:choose>
                                                 </xsl:when>
                                                 <xsl:otherwise>
                                                     <xsl:choose>
                                                         <xsl:when test="./VALUE[@pid = $pointId]/./@status != ''">
                                                             <td class="{./VALUE[@pid = $pointId]/./@status}-color"><xsl:value-of select="./VALUE[@pid = $pointId]/." /></td>
                                                         </xsl:when>
                                                         <xsl:otherwise>
                                                             <td ><xsl:value-of select="./VALUE[@pid = $pointId]/." /></td>
                                                         </xsl:otherwise>
                                                     </xsl:choose>
                                                     <xsl:variable name="cornerName" select="./../../../../../INPUTPARAMS/INPUTPARAM/DESIGNPOINT/VALUE[@pid = $pointId]/@corner" />
                                                     <xsl:variable name="opName" select="../@name" />
                                                     <xsl:variable name="targetVal" select="./../../../../../../CORNERSPECS/CORNERSPEC[@resultName = $opName and @cornerName = $cornerName]/@specdesc" />
                                                     <xsl:variable name="nominalTargetVal" select="./../../../../../../CORNERSPECS/CORNERSPEC[@resultName = $opName and @cornerName = 'Nominal']/@specdesc" />
                                                     <xsl:variable name="specVaries" select="./../../../../../../CORNERSPECS/CORNERSPEC[@resultName = $opName and @cornerName = 'Nominal']/@varyingSpec" />
                                                     <xsl:variable name="specCountForResult" select="count(./../../../../../../CORNERSPECS/CORNERSPEC[@resultName = $opName])" />
                                                     <xsl:choose>
                                                         <xsl:when test="$specCountForResult > 1">
														     <xsl:choose>
															     <xsl:when test="$targetVal != 'spec disabled'">
                                                                     <td ><xsl:value-of select="$targetVal" /></td>
                                                                 </xsl:when>
															     <xsl:when test="$targetVal = 'spec disabled'">
                                                                     <td ><xsl:value-of select="$targetVal" /></td>
                                                                 </xsl:when>
															     <xsl:when test="$nominalTargetVal != 'spec disabled'">
                                                                     <td ><xsl:value-of select="$nominalTargetVal" /></td>
                                                                 </xsl:when>
														     </xsl:choose>
                                                         </xsl:when>
                                                         <xsl:when test="$specCountForResult > 1 and $targetVal = 'spec disabled'">
                                                             <td class="disabled-color"><xsl:value-of select="$targetVal" /></td>
                                                         </xsl:when>
                                                         <xsl:when test="$specVaries = 'true'">
                                                             <td ><xsl:value-of select="./VALUE[@pid = $pointId]/./@target" /></td>
                                                         </xsl:when>
                                                         <xsl:when test="$specCountForResult > 1 and $specVaries = 'false'">
                                                             <td ><xsl:value-of select="./VALUE[@pid = $pointId]/./@target" /></td>
                                                         </xsl:when>
														 <xsl:when test="$specCountForResult = 1 and $nominalTargetVal != ''">
                                                             <td ><xsl:value-of select="$nominalTargetVal"/></td>
                                                         </xsl:when>
                                                         <xsl:otherwise>
                                                         </xsl:otherwise>
                                                     </xsl:choose>
                                                 </xsl:otherwise>
                                             </xsl:choose>
                                         </xsl:for-each>
                                     </xsl:otherwise>
                                 </xsl:choose>
                             </xsl:for-each>
                         </tr>
                     </xsl:for-each>
                 </xsl:for-each>
             </table>
             </xsl:for-each>
         </xsl:template>

         <xsl:template match="WAVEFORMS">
             <a href="#pageTop"><h6 class="text-right"> ^Top </h6></a>
             <a name="Waveforms"><h1>Waveforms</h1></a>
             <xsl:choose>
                 <xsl:when test="$waveformsCount=0">
                     <ul><li><u>No plots defined</u></li></ul>
                 </xsl:when>
                 <xsl:otherwise>
                     <br/>
                     <table>
                         <xsl:for-each select="WAVEFORM">
                             <xsl:variable name="waveformFileName">
                                 <xsl:call-template name="str-replace">
                                     <xsl:with-param name="text" ><xsl:value-of select="@fileName" /></xsl:with-param>
                                     <xsl:with-param name="searchStr" >#</xsl:with-param>
                                     <xsl:with-param name="replaceStr" >%23</xsl:with-param>
                                 </xsl:call-template>
                             </xsl:variable>
                             <tr>
                                 <td> <img src="{$waveformFileName}"/></td>
                             </tr>
                             <xsl:variable name="isWaveQuickPlot" select = "@isWaveQuickPlot" /> 
                             <xsl:if test="$isWaveQuickPlot = 'true'">
                                 <xsl:text> NOTE: Created by using the quick plot data </xsl:text>
                             </xsl:if>
                         </xsl:for-each>
                     </table>
                     <br/>
                 </xsl:otherwise>
             </xsl:choose>                
         </xsl:template>


         <xsl:template name="calc_pass_percentage">
             <xsl:param name="resName" />
             <xsl:value-of select="count(/ROOT/RESULTS/TESTOUTPUTS/TESTOUTPUT[1]/OUTPUTPARAMS/OUTPUTPARAM[@name = $resName]/DESIGNPOINT[*]/VALUE[@status = 'pass']) div count(/ROOT/RESULTS/TESTOUTPUTS/TESTOUTPUT[1]/OUTPUTPARAMS/OUTPUTPARAM[@name = $resName]/DESIGNPOINT[*]/VALUE) * 100"/>
         </xsl:template>


         <xsl:template name="substring-after-last">
             <xsl:param name="input" />
             <xsl:param name="marker" />
             <xsl:choose>
                 <xsl:when test="contains($input,$marker)">
                     <xsl:call-template name="substring-after-last">
                         <xsl:with-param name="input" select="substring-after($input,$marker)" />
                         <xsl:with-param name="marker" select="$marker" />
                 </xsl:call-template>
             </xsl:when>
             <xsl:otherwise>
                 <xsl:value-of select="$input" />
             </xsl:otherwise>
         </xsl:choose>
     </xsl:template>

     <xsl:template name="text_wrapper">
         <xsl:param name="Text"/>
         <xsl:choose>
             <xsl:when test="string-length($Text)">
                 <xsl:choose>
                     <xsl:when test="contains($Text, '::')">
                         <xsl:value-of select="substring-before($Text,'::')"/><xsl:text>::</xsl:text><br/>
                     </xsl:when>
                     <xsl:otherwise>
                         <xsl:value-of select="$Text" />
                     </xsl:otherwise>
                 </xsl:choose>
                 <xsl:call-template name="text_wrapper">
                     <xsl:with-param name="Text" select="substring-after($Text,'::')"/>
                 </xsl:call-template>
             </xsl:when>
         </xsl:choose>
     </xsl:template>


     <xsl:template name="str-replace">
         <xsl:param name="text" />
         <xsl:param name="searchStr" />
         <xsl:param name="replaceStr" />
         <xsl:choose>
             <xsl:when test="contains($text, $searchStr)">
                 <xsl:value-of select="substring-before($text,$searchStr)" />
                 <xsl:value-of select="$replaceStr" />
                 <xsl:call-template name="str-replace">
                     <xsl:with-param name="text" select="substring-after($text,$searchStr)" />
                     <xsl:with-param name="searchStr" select="$searchStr" />
                     <xsl:with-param name="replaceStr" select="$replaceStr" />
                 </xsl:call-template>
             </xsl:when>
             <xsl:otherwise>
                 <xsl:value-of select="$text" />
             </xsl:otherwise>
         </xsl:choose>
     </xsl:template>

 </xsl:stylesheet>
