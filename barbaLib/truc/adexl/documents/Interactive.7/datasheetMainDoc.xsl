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
 * Purpose: XSL file for main datasheet document.
 *
 *************************************************************
 * $Revision: #1 $
 * $Author: cicinteg $
 *************************************************************
 -->
 
<xsl:stylesheet xmlns:xhtml="http://www.w3.org/1999/xhtml" xmlns="http://www.w3.org/1999/xhtml" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="xml" version="1.0" doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"/>

<xsl:key name="var-types-keys" match="/ROOT/CORNERS/CORNER/VARS/VAR" use="@name" />
<xsl:key name="vars-by-cornername" match="/ROOT/CORNERS/CORNER/VARS/VAR" use="ancestor::CORNER[1]/attribute::name" />

<xsl:key name="param-types-keys" match="/ROOT/CORNERS/CORNER/PARAMS/LOCATIONS/LOCATION/PARAM" use="@name" />
<xsl:key name="params-by-cornername" match="/ROOT/CORNERS/CORNER/PARAMS/LOCATIONS/LOCATION/PARAM" use="ancestor::CORNER[1]/attribute::name" />

<xsl:key name="model-types-keys" match="/ROOT/CORNERS/CORNER/MODELS/MODEL" use="@name" />
<xsl:key name="models-by-cornername" match="/ROOT/CORNERS/CORNER/MODELS/MODEL" use="ancestor::CORNER[1]/attribute::name" />

<xsl:key name="rsitem-types-keys" match="/ROOT/RESULTSSUMMARY/RSITEM" use="@test" />
<xsl:key name="testdoc-types-keys" match="/ROOT/TESTDOCS/TESTDOC" use="@testName" />

<xsl:variable name="fNamePrefix" select="/ROOT/@fnameprefix" />
<xsl:variable name="viewMode" select="/ROOT/@viewMode" />
	
<xsl:variable name="cornersCount" select="count(/ROOT/CORNERS/CORNER)" />
<xsl:variable name="variablesCount" select="count(/ROOT/VARS/VAR)" />
<xsl:variable name="parametersCount" select="count(/ROOT/PARAMS/LOCATIONS/LOCATION)" />
<xsl:variable name="modelGroupsCount" select="count(/ROOT/MODELGROUPS/MODELGROUP)" />
<xsl:variable name="schematicVariablesCount" select="count(/ROOT/SCHEMATICVARS/VARS/VAR)" />
<xsl:variable name="firstTestName" >
	<xsl:call-template name="str-replace">
		<xsl:with-param name="text" ><xsl:value-of select="/ROOT/TESTDOCS/TESTDOC[1]/@testFileName" /></xsl:with-param>
		<xsl:with-param name="searchStr" >#</xsl:with-param>
		<xsl:with-param name="replaceStr" >%23</xsl:with-param>
	</xsl:call-template>
</xsl:variable>


<xsl:variable name="confidencePercentileValue" select="document(concat('./',$fNamePrefix, '_', translate($firstTestName, ':', '_'),'.xml'))/ROOT/IYRESULTS/IYMATE/@IYconfidencePercentile" />
<xsl:variable name="errorFilterSettingStr" select="document(concat('./',$fNamePrefix, '_', translate($firstTestName, ':', '_'),'.xml'))/ROOT/IYRESULTS/IYMATE/@IYerrorFilterSetting" />
<xsl:variable name="yieldResultsCount" select="count(document(concat('./',$fNamePrefix, '_', translate($firstTestName, ':', '_'),'.xml'))/ROOT/IYRESULTS/IYRESULTITEM)" />
<xsl:variable name="detailedResultsCount" select="count(document(concat('./',$fNamePrefix, '_', translate($firstTestName, ':', '_'),'.xml'))/ROOT/RESULTS/TESTOUTPUTS/TESTOUTPUT) + count(document(concat('./',$fNamePrefix, '_',translate($firstTestName, ':', '_'), '.xml'))/ROOT/WAVEFORMS)" />

<xsl:template match="/ROOT">
    <html lang="en" xmlns="http://www.w3.org/1999/xhtml">
    	<head>
    		<title>Data Sheet</title>
		<link rel="stylesheet" type="text/css" href="datasheet.css" />
    	</head>
	<body>
		<xsl:variable name="sessionSummaryAvailable" select="count(child::TESTS | child::VARS | child::PARAMS | child::CORNERS)" />
		<xsl:variable name="resultsSummaryAvailable" select="count(descendant::RESULTSSUMMARY)" />
		<xsl:variable name="testsSummaryAvailable" select="count(child::TESTS)" />
		<xsl:variable name="varsSummaryAvailable" select="count(child::VARS)" />
		<xsl:variable name="paramsSummaryAvailable" select="count(child::PARAMS)" />
		<xsl:variable name="cornersSummaryAvailable" select="count(child::CORNERS)" />
		<xsl:variable name="mcOptionsAvailable" select="count(child::MCOPTIONS)" />
		<xsl:variable name="schematicVariablesAvailable" select="count(child::SCHEMATICVARS)" />
		<xsl:variable name="testDocsAvailable" select="count(child::TESTDOCS)" />
		<xsl:variable name="IYResultsAvailable" select="$yieldResultsCount" />
		<xsl:variable name="detailedResultsAvailable" select="$detailedResultsCount" />
		

		<p />
		<a name="pageTop"><h1>Datasheet for run <xsl:value-of select="@name" /> </h1></a>
		<p />
		<xsl:apply-templates select="DESCRIPTION" />
		<h2>Source and Contents </h2>
		<p />
		The run mode is: <xsl:value-of select="@runMode" />.
		<p />
		<xsl:if test="@parasiticsRunMode != 'None'">
			Parasitics run mode : <xsl:value-of select="@parasiticsRunMode" />.
		</xsl:if>
		<p />
		<ul>
		<li><a href="#SetupSummary">Setup Summary</a></li>
		<xsl:if test="$resultsSummaryAvailable = 1">
			<li><a href="#ResultsSummary">Results Summary</a></li>
		</xsl:if>
		<xsl:if test="$IYResultsAvailable >= 1">
			<li><a href="#IYResults">Yield Results Summary</a></li>
		</xsl:if>

		<xsl:if test="$sessionSummaryAvailable >= 1">
			<li><a href="#SessionSummary">Session Summary</a></li>
		</xsl:if>
			<ul>
				<xsl:if test="$testsSummaryAvailable = 1">
					<li><a href="#TestsSummary">Tests Summary</a></li>
				</xsl:if>
				<xsl:if test="$mcOptionsAvailable = 1">
					<li><a href="#MCOptions">Monte Carlo Run Options</a></li>
				</xsl:if>
				<xsl:if test="$schematicVariablesAvailable = 1">
					<li><a href="#SchematicVariables">Schematic Point Variables</a></li>
				</xsl:if>

				<xsl:if test="$varsSummaryAvailable = 1">
					<li><a href="#SessionVariables">Variables</a></li>
				</xsl:if>
				<xsl:if test="$paramsSummaryAvailable = 1">
					<li><a href="#SessionParameters">Parameters</a></li>
				</xsl:if>
				<xsl:if test="$cornersSummaryAvailable = 1">
					<li><a href="#SessionCorners">Corners</a></li>
					<ul>
						<li><a href="#TestsCornersMatrix">Tests/Corners Matrix</a></li>
						<li><a href="#ModelGroups">Model Groups</a></li>
					</ul>
				</xsl:if>
			</ul>
			
			<xsl:if test="$detailedResultsAvailable >= 1">
				<li><a href="#DetailedResults">Detailed Results</a>
					<ul>
					<xsl:for-each select="TESTDOCS/TESTDOC">
					<xsl:variable name="testFileNameVar">
						<xsl:call-template name="str-replace">
							<xsl:with-param name="text" ><xsl:value-of select="@testFileName" /></xsl:with-param>
							<xsl:with-param name="searchStr" >#</xsl:with-param>
							<xsl:with-param name="replaceStr" >%23</xsl:with-param>
						</xsl:call-template>
					</xsl:variable>
					<li><a href="{$fNamePrefix}_{translate($testFileNameVar, ':', '_')}.xml"><xsl:value-of select="@testName" /></a></li>
					</xsl:for-each>
					</ul>
			</li>
			</xsl:if>
		</ul>
		<p />
		<xsl:apply-templates select="SETUPSUMMARY" />
		<p />
		<xsl:apply-templates select="RESULTSSUMMARY" />
		<xsl:if test="$IYResultsAvailable >= 1">
			<xsl:call-template name = "IYRESULTS"></xsl:call-template>
		</xsl:if>
		<xsl:if test="$sessionSummaryAvailable >= 1">
			<a name="SessionSummary"><h1>Session Summary</h1></a>

			<p />
                <xsl:choose>
                    <xsl:when test="$viewMode='explorer'">
                        Inputs and setup for the ADE Explorer session.
                    </xsl:when>
                    <xsl:when test="$viewMode='assembler'">
                        Inputs and setup for the ADE Assembler session.
                    </xsl:when>
                    <xsl:otherwise>
                        Inputs and setup for the ADE XL session.
                    </xsl:otherwise>
                </xsl:choose>
			<p />
		</xsl:if>
		<xsl:apply-templates select="TESTS" />
		<p />
		<xsl:apply-templates select="MCOPTIONS" />
		<p />
		<xsl:apply-templates select="SCHEMATICVARS" />
		<p />
		<xsl:apply-templates select="VARS" />
		<p />
		<xsl:apply-templates select="PARAMS" />
		<p />
		<xsl:apply-templates select="CORNERS" />
		<p />
		<xsl:apply-templates select="TESTDOCS" />
		<p />
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

<xsl:template match="DESCRIPTION">
	<h2>Description </h2>
	<p />
    <xsl:variable name="stringIn"> <xsl:value-of select="." /> </xsl:variable>
    <xsl:call-template name="replaceLineFeed">
             <xsl:with-param name="strInput" select="$stringIn"/>
    </xsl:call-template>
</xsl:template>

<xsl:template match="TESTS">
	<a href="#pageTop"><h6 class="text-right"> ^Top </h6></a>
	<a name="TestsSummary"><h2>Tests Summary</h2></a>
	<br />
	<table>
	<tr>
	<th>Test</th>
	<th>Lib/Cell/View</th>
	<th>Simulator</th>
	<th>State</th>
	</tr>
	<xsl:for-each select="TEST">
		<tr class="row{position() mod 2}">
		<xsl:variable name="testName"><xsl:value-of select="." /></xsl:variable>
		<xsl:variable name="testFileNameVar">
			<xsl:call-template name="str-replace">
				<xsl:with-param name="text" ><xsl:value-of select="/ROOT/TESTDOCS/TESTDOC[@testName = $testName]/@testFileName" /></xsl:with-param>
				<xsl:with-param name="searchStr" >#</xsl:with-param>
				<xsl:with-param name="replaceStr" >%23</xsl:with-param>
			</xsl:call-template>
		</xsl:variable>
		<xsl:variable name="dirName"><xsl:value-of select="/ROOT/SCHDIAGRAMS/@exportPath" /></xsl:variable>
		<xsl:variable name="libName"><xsl:value-of select="@lib" /></xsl:variable>
		<xsl:variable name="cellName"><xsl:value-of select="@cell" /></xsl:variable>
		<xsl:variable name="viewName"><xsl:value-of select="@view" /></xsl:variable>
		<td><a href="{$fNamePrefix}_{translate($testFileNameVar, ':', '_')}.xml"><xsl:value-of select="." /></a></td>
		<td>
		<xsl:choose>
		    <xsl:when test="not($dirName='')">
			<a href="./{$libName}.{$cellName}.{$viewName}/index.html"> <xsl:value-of select="@lib" />.<xsl:value-of
select="@cell" />.<xsl:value-of select="@view" /> </a>
		    </xsl:when>
		    <xsl:otherwise>
			<xsl:value-of select="@lib" />.<xsl:value-of select="@cell" />.<xsl:value-of select="@view" />
		    </xsl:otherwise>
		</xsl:choose>
        </td>
		<td><xsl:value-of select="@simultor" /></td>
		<td><xsl:value-of select="@state" /></td>
        	</tr>
	</xsl:for-each>
	</table>
</xsl:template>

<xsl:template match="TESTDOCS">
	<xsl:if test="$detailedResultsCount >= 1">
		<a href="#pageTop"><h6 class="text-right"> ^Top </h6></a>
		<a name="DetailedResults"><h1>Detailed Results</h1></a>
		<ul>
			<xsl:for-each select="TESTDOC">
				<xsl:variable name="testFileNameVar">
						<xsl:call-template name="str-replace">
							<xsl:with-param name="text" ><xsl:value-of select="@testFileName" /></xsl:with-param>
							<xsl:with-param name="searchStr" >#</xsl:with-param>
							<xsl:with-param name="replaceStr" >%23</xsl:with-param>
						</xsl:call-template>
				</xsl:variable>
				<li><a href="{$fNamePrefix}_{translate($testFileNameVar, ':', '_')}.xml"><xsl:value-of select="@testName" /></a></li>
			</xsl:for-each>
		</ul>
 	</xsl:if>
</xsl:template>

<xsl:template match="MCOPTIONS">
	<a href="#pageTop"><h6 class="text-right"> ^Top </h6></a>
	<a name="MCOptions"><h2>Monte Carlo Run Options</h2></a>
	<br />
	<table>
	<tr>
	<th>Name</th>
	<th>Value</th>
	</tr>
	<xsl:for-each select="@*">
		<tr class="row{position() mod 2}">
		<xsl:choose>
			<xsl:when test="name()='mcmethod'">
				<td>Monte Carlo Sampling Variation (process/mismatch/all)</td>
				<td><xsl:value-of select="." /></td>
			</xsl:when>
			<xsl:when test="name()='mcnumpoints'">
				<td>Monte Carlo Total Points (number)</td>
				<td><xsl:value-of select="." /></td>
			</xsl:when>
			<xsl:when test="name()='mcstartingrunnumber'">
				<td>Monte Carlo Starting Iteration Number (number)</td>
				<td><xsl:value-of select="." /></td>
			</xsl:when>
			<xsl:when test="name()='montecarloseed'">
				<td>Monte Carlo Seed (number)</td>
				<td><xsl:value-of select="." /></td>
			</xsl:when>
			<xsl:when test="name()='samplingmode'">
				<td>Monte Carlo Sampling Mode (Random/Latin Hypercube/Low-Discrepancy Sequence)</td>
				<td><xsl:value-of select="." /></td>
			</xsl:when>
			<xsl:when test="name()='timelimit'">
				<td>Time Limit</td>
				<td><xsl:value-of select="." /></td>
			</xsl:when>
			<xsl:when test="name()='donominal'">
				<td>Run Nominal</td>
				<xsl:choose>
					<xsl:when test=".='1'">
						<td class="enabled"></td>
					</xsl:when>
					<xsl:otherwise>
						<td class="disabled"></td>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
		</xsl:choose>

		</tr>
	</xsl:for-each>
	</table>
</xsl:template>


<xsl:template match="SCHEMATICVARS">
	<a href="#pageTop"><h6 class="text-right"> ^Top </h6></a>
	<a name="SchematicVariables"><h2>Schematic Point Variables</h2></a>
	<xsl:choose>
		<xsl:when test="$schematicVariablesCount=0">
			<ul><li><u>No schematic variables defined</u></li></ul>
		</xsl:when>
		<xsl:otherwise>
			<br />
			<table>
			<tr>
			<th>Name</th>
			<th>Value</th>
			</tr>
			<xsl:for-each select="VARS/VAR">
				<tr class="row{position() mod 2}">
				<td><xsl:value-of select="@name" /></td>
				<td><xsl:value-of select="." /></td>
				</tr>
			</xsl:for-each>
			</table>
		</xsl:otherwise>
	</xsl:choose>

</xsl:template>

<xsl:template match="VARS">
	<a href="#pageTop"><h6 class="text-right"> ^Top </h6></a>
	<a name="SessionVariables"><h2>Variables </h2></a>
	<xsl:choose>
		<xsl:when test="$variablesCount=0">
			<ul><li><u>No variables defined</u></li></ul>
		</xsl:when>
		<xsl:otherwise>
		<xsl:choose>
			<xsl:when test="count(/ROOT/VARS/VAR/LOCAL)>0">
				<xsl:call-template name="varsHasDisabledGlobals">
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
			<br />

			<table>
			<tr>
			<th>Name</th>
			<th>Value</th>
			</tr>
			<xsl:for-each select="VAR">
        <xsl:variable name="index"><xsl:value-of select="@colorIndex" /></xsl:variable>
        <xsl:choose>
          <xsl:when test="$index > 0">
            <tr class="pset_color{$index}">
              <td><xsl:value-of select="@name" /></td>
              <td><xsl:value-of select="." /></td>
            </tr>
          </xsl:when>
          <xsl:otherwise>
            <tr class="row{position() mod 2}">
              <td><xsl:value-of select="@name" /></td>
              <td><xsl:value-of select="." /></td>
            </tr>
          </xsl:otherwise>
        </xsl:choose>
			</xsl:for-each>
			</table>
			</xsl:otherwise>
		</xsl:choose>
		</xsl:otherwise>
	</xsl:choose>

</xsl:template>

<xsl:template name="varsHasDisabledGlobals">
	<br />
	<table>
	<tr>
	<th>Name</th>
	<th>Test</th>
	<th>Value</th>
	</tr>
	<xsl:for-each select="VAR">
    <xsl:variable name="index"><xsl:value-of select="@colorIndex" /></xsl:variable>
		<xsl:variable name="varName"><xsl:value-of select="@name" /></xsl:variable>
		<xsl:variable name="varCount"><xsl:value-of select="1+count(preceding-sibling::*)" /></xsl:variable>
		<xsl:for-each select="/ROOT/TESTS/TEST">
			<xsl:variable name="testName"><xsl:value-of select="." /></xsl:variable>
      <xsl:choose>
        <xsl:when test="$index > 0">
          <tr class="pset_color{$index}">
            <td>
              <xsl:if test="position() = 1">
                <xsl:value-of select="$varName"/> 
              </xsl:if>
            </td>
            <td>
              <xsl:value-of select="."/> 
            </td>
            <td>
              <xsl:choose>
                <xsl:when test="/ROOT/VARS/VAR[@name=$varName]/LOCAL[@test=current()]">
                  <xsl:value-of select="/ROOT/VARS/VAR[@name=$varName]/LOCAL[@test=$testName]/@value" />
                  <xsl:if test="/ROOT/VARS/VAR[@name=$varName]/LOCAL[@test=current()]/@omitted">
                    disabled
                  </xsl:if>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:value-of select="/ROOT/VARS/VAR[@name=$varName]/."/>
                </xsl:otherwise>
              </xsl:choose>
            </td>
          </tr>
        </xsl:when>
        <xsl:otherwise>
          <tr class="row{$varCount mod 2 }">
            <td>
              <xsl:if test="position() = 1">
                <xsl:value-of select="$varName"/> 
              </xsl:if>
            </td>
            <td>
              <xsl:value-of select="."/> 
            </td>
            <td>
              <xsl:choose>
                <xsl:when test="/ROOT/VARS/VAR[@name=$varName]/LOCAL[@test=current()]">
                  <xsl:value-of select="/ROOT/VARS/VAR[@name=$varName]/LOCAL[@test=$testName]/@value" />
                  <xsl:if test="/ROOT/VARS/VAR[@name=$varName]/LOCAL[@test=current()]/@omitted">
                    disabled
                  </xsl:if>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:value-of select="/ROOT/VARS/VAR[@name=$varName]/."/>
                </xsl:otherwise>
              </xsl:choose>
            </td>
          </tr>
        </xsl:otherwise>
      </xsl:choose>
		</xsl:for-each>
	</xsl:for-each>
	</table>
</xsl:template>

<xsl:template match="PARAMS">
	<a href="#pageTop"><h6 class="text-right"> ^Top </h6></a>
	<a name="SessionParameters"><h2>Parameters </h2></a>
	<xsl:choose>
		<xsl:when test="$parametersCount=0">
			<ul><li><u>No parameters defined</u></li></ul>
		</xsl:when>
		<xsl:otherwise>
			<br />

			<table>
			<tr>
			<th>CellView/Device</th>
			<th>Parameter</th>
			<th>Value</th>
			</tr>
			<xsl:for-each select="LOCATIONS">
				<xsl:for-each select="LOCATION">
					<xsl:variable name="locpos" select="position()" />
					<xsl:for-each select="PARAM">
            <xsl:variable name="index"><xsl:value-of select="@colorIndex" /></xsl:variable>
            <xsl:choose>
              <xsl:when test="$index > 0">
                <tr class="pset_color{$index}">
                  <td><xsl:value-of select="../@name" /></td>
                  <td><xsl:value-of select="@name" /></td>
                  <td><xsl:value-of select="." /></td>
                </tr>
              </xsl:when>
              <xsl:otherwise>
                <tr class="row{($locpos) mod 2}">
                  <td><xsl:value-of select="../@name" /></td>
                  <td><xsl:value-of select="@name" /></td>
                  <td><xsl:value-of select="." /></td>
                </tr>
              </xsl:otherwise>
            </xsl:choose>
					</xsl:for-each>
				</xsl:for-each>
			</xsl:for-each>
			</table>
		</xsl:otherwise>
	</xsl:choose>

</xsl:template>

<xsl:template match="CORNERS">
	<a href="#pageTop"><h6 class="text-right"> ^Top </h6></a>
	<a name="SessionCorners"><h2>Corners </h2></a>
	<p />
	<xsl:choose>
		<xsl:when test="$cornersCount=0">
			<ul><li><u>No corners defined</u></li></ul>
		</xsl:when>
		<xsl:otherwise>
			<h3> Variable Values at Corners </h3>
			<br/>
			<table>
				<xsl:variable name="var-types" select="CORNER/VARS/VAR[generate-id() = generate-id(key('var-types-keys', @name)[1])]/@name" />
				<xsl:variable name="param-types" select="CORNER/PARAMS/LOCATIONS/LOCATION/PARAM[generate-id() = generate-id(key('param-types-keys', @name)[1])]/@name" />
				<xsl:variable name="model-types" select="CORNER/MODELS/MODEL[generate-id() = generate-id(key('model-types-keys', @name)[1])]/." />
			<tr>
			<th>Corner Name</th>
			<xsl:for-each select="$var-types">
				<th>
				<xsl:call-template name="text_wrapper">
					<xsl:with-param name="Text" ><xsl:value-of select="." /></xsl:with-param>
				</xsl:call-template>
				</th>
			</xsl:for-each>
			<xsl:for-each select="$param-types">
				<th>
				<xsl:value-of select="." />
				</th>
			</xsl:for-each>
			<xsl:for-each select="$model-types">
				<th colspan="2">
				<a href="{.}"> <xsl:value-of select="@name" /> </a>


				</th>
			</xsl:for-each>
			<xsl:if test="$modelGroupsCount > 0">
				<xsl:for-each select="CORNER[1]/MODELGROUPNAME">
					<th>ModelGroup(s)</th>
				</xsl:for-each>
			</xsl:if>
			</tr>


			<xsl:for-each select="CORNER">
				<xsl:variable name="vars" select="key('vars-by-cornername', ./@name)" />
				<xsl:variable name="params" select="key('params-by-cornername', ./@name)" />
				<xsl:variable name="models" select="key('models-by-cornername', ./@name)" />
				<tr class="row{position() mod 2}">
				<td><xsl:value-of select="./@name" /> </td>
				<xsl:for-each select="$var-types">
					<td>
					<xsl:value-of select="$vars[@name = current()]" />
					</td>
				</xsl:for-each>
				<xsl:for-each select="$param-types">
					<td>
					<xsl:value-of select="$params[@name = current()]" />
					</td>
				</xsl:for-each>
				<xsl:for-each select="$model-types/@name">
					<xsl:choose>
						<xsl:when test="$models[@name = current()]/@enabled='true'">
						<td class="enabled"></td>
						</xsl:when>
						<xsl:when test="$models[@name = current()]/@enabled='false'">
						<td class="disabled"></td>
						</xsl:when>
					</xsl:choose>
					<td>
					<xsl:choose>
						<xsl:when test="not($models[@name = current()]/@section = '')">
							<xsl:value-of select="$models[@name = current()]/@section" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:text>None</xsl:text>
						</xsl:otherwise>
					</xsl:choose>
					</td>

				</xsl:for-each>
				<xsl:if test="$modelGroupsCount > 0">
					<xsl:for-each select="MODELGROUPNAME">
						<td>
						<xsl:choose>
							<xsl:when test="not(. = '')">
								<xsl:value-of select="." />
							</xsl:when>
							<xsl:otherwise>
								<xsl:text>None</xsl:text>
							</xsl:otherwise>
						</xsl:choose>
						</td>
					</xsl:for-each>
				</xsl:if>
				</tr>
			</xsl:for-each>
			</table>
		</xsl:otherwise>
	</xsl:choose>
	<p />
	<a href="#pageTop"><h6 class="text-right"> ^Top </h6></a>
	<a name="TestsCornersMatrix"><h3> Tests/Corners Matrix </h3></a>
	<xsl:choose>
		<xsl:when test="$cornersCount=0">
			<ul><li><u>No corners defined</u></li></ul>
		</xsl:when>
		<xsl:otherwise>
			<br/>
			<table>
			<tr>
			<th>Corner</th>
			<xsl:for-each select="CORNER[1]/TESTSSTATUS/TEST">
				<th><xsl:value-of select="@name" /></th>
			</xsl:for-each>
			</tr>
			<xsl:for-each select="CORNER">
				<tr class="row{position() mod 2}">
				<td><xsl:value-of select="@name" /></td>
				<xsl:for-each select="TESTSSTATUS/TEST">
					<xsl:choose>
						<xsl:when test="@enabled='true'">
							<td class="enabled"></td>
						</xsl:when>
						<xsl:when test="@enabled='false'">
							<td class="disabled"></td>
						</xsl:when>
					</xsl:choose>
				</xsl:for-each>
				</tr>
			</xsl:for-each>
			</table>
		</xsl:otherwise>
	</xsl:choose>
	<p />
	<xsl:apply-templates select="../MODELGROUPS" />
</xsl:template>


<xsl:template match="MODELGROUPS">
	<a href="#pageTop"><h6 class="text-right"> ^Top </h6></a>
	<a name="ModelGroups"><h3> Model Groups </h3></a>

	<xsl:choose>
		<xsl:when test="$modelGroupsCount=0">
			<ul><li><u>No model groups defined</u></li></ul>
		</xsl:when>
		<xsl:otherwise>
			<br/>
			<table>
			<tr>
			<th>Model Group Name</th>
			<th>Model File</th>
			<th>Test</th>
			<th>Block</th>
			<th>Section</th>
			</tr>
			<xsl:for-each select="MODELGROUP">
				<tr class="row{position() mod 2}">
				<td><xsl:value-of select="@name" /></td>
				<td>
				<xsl:for-each select="MODELS/MODEL">
					<a href="{.}"> <xsl:value-of select="." /> </a> <br/>
				</xsl:for-each>
				</td>
				<td>
				<xsl:for-each select="MODELS/MODEL">
					<xsl:value-of select="@test" /><br/>
				</xsl:for-each>
				</td>
				<td>
				<xsl:for-each select="MODELS/MODEL">
					<xsl:value-of select="@block" /><br/>
				</xsl:for-each>
				</td>
				<td>
				<xsl:for-each select="MODELS/MODEL">
					<xsl:value-of select="@section" /><br/>
				</xsl:for-each>
				</td>
				</tr>
			</xsl:for-each>
			</table>
		</xsl:otherwise>
	</xsl:choose>

</xsl:template>

<xsl:template match="SETUPSUMMARY">
	<a href="#pageTop"><h6 class="text-right"> ^Top </h6></a>
	<a name="SetupSummary"><h1>Setup Summary</h1></a>
	<br/>

	<table>
		<tr><td class="thcell">Library</td><td class="row0"><xsl:value-of select="@lib" /></td></tr>
		<tr><td class="thcell">Cell</td><td class="row1"><xsl:value-of select="@cell" /></td></tr>
		<tr><td class="thcell">View</td><td class="row0"><xsl:value-of select="@view" /></td></tr>
	</table>
	
	<br/>
</xsl:template>

<xsl:template match="RESULTSSUMMARY">
	<a href="#pageTop"><h6 class="text-right"> ^Top </h6></a>
	<a name="ResultsSummary"><h1>Results Summary</h1></a>
	<br/>

	<table>
	<tr>
	<th><xsl:text>&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;</xsl:text></th>
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
	
	<xsl:variable name="colCnt">  <xsl:value-of select="count(/ROOT/RESULTSSUMMARY/RSCOLNAME)"/></xsl:variable>

	<xsl:variable name="rsitem-types" select="RSITEM[generate-id() = generate-id(key('rsitem-types-keys', @test)[1])]/@test" />

	<xsl:for-each select="$rsitem-types">
		<xsl:variable name="testName"><xsl:value-of select="."/></xsl:variable>
		<xsl:variable name="testFileNameVar">
			<xsl:call-template name="str-replace">
				<xsl:with-param name="text" ><xsl:value-of select="/ROOT/TESTDOCS/TESTDOC[@testName = $testName]/@testFileName" /></xsl:with-param>
				<xsl:with-param name="searchStr" >#</xsl:with-param>
				<xsl:with-param name="replaceStr" >%23</xsl:with-param>
			</xsl:call-template>
		</xsl:variable>

		<tr>
		<td class="rowSubHeader" colspan="{9 + $colCnt}" ><a href="{$fNamePrefix}_{translate($testFileNameVar, ':', '_')}.xml"><xsl:value-of select="$testName" /></a></td>
		</tr>
		<xsl:variable name="testData" select="document(concat('./',$fNamePrefix, '_', translate($testFileNameVar, ':', '_'), '.xml'))"/>
		<xsl:for-each select="$testData/ROOT/RESULTSSUMMARY/RSITEM">
			<xsl:if test="$testName = @test">
				<xsl:variable name="pass_percentage">
					<xsl:call-template name = "calc_pass_percentage">
						<xsl:with-param name = "resName" ><xsl:value-of select="@resultName"/></xsl:with-param>
					</xsl:call-template>
				</xsl:variable>
				<tr class="row{position() mod 2}">
				<td></td>
				<td><a href="{$fNamePrefix}_{translate($testFileNameVar, ':', '_')}.xml"><xsl:value-of select="@test" /></a></td>
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
				<xsl:variable name="specVaries" select="./../../CORNERSPECS/CORNERSPEC[@resultName = $opName and @cornerName = 'Nominal']/@varyingSpec" />
				<xsl:choose>
					<xsl:when test="$specCountForResult > 1 or $specVaries=false">
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
							<xsl:if test="$testName = @testName">
								<xsl:if test="$opName = @resultName">
			                				<td><xsl:value-of select="@colValue" /></td>
								</xsl:if>
							</xsl:if>
						</xsl:if>
        				</xsl:for-each>
				</xsl:for-each>
				</tr>
			</xsl:if>
		</xsl:for-each>
	</xsl:for-each>
	</table>
	<br/>
</xsl:template>

<xsl:template name="IYRESULTS">
	<a href="#pageTop"><h6 class="text-right"> ^Top </h6></a>
	<a name="IYResults"><h1>Yield Results Summary</h1></a>

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
			<th><xsl:text>&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;</xsl:text></th>
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
			<xsl:if test="@enableCpkPerc = 'enable'">
				<th>Cpk(Use Median and Percentile)</th>
			</xsl:if>
			<th>Number Of Errors</th>
			</tr>
			<xsl:variable name="testdoc-types" select="/ROOT/TESTDOCS/TESTDOC[generate-id() = generate-id(key('testdoc-types-keys', @testName)[1])]/@testName" />
			<xsl:for-each select="$testdoc-types">
				<xsl:variable name="testName"><xsl:value-of select="."/></xsl:variable>
				<xsl:variable name="testFileNameVar">
					<xsl:call-template name="str-replace">
						<xsl:with-param name="text" ><xsl:value-of select="/ROOT/TESTDOCS/TESTDOC[@testName = $testName]/@testFileName" /></xsl:with-param>
						<xsl:with-param name="searchStr" >#</xsl:with-param>
						<xsl:with-param name="replaceStr" >%23</xsl:with-param>
					</xsl:call-template>
				</xsl:variable>
				<tr>
				<td class="rowSubHeader" colspan="13"><a href="{$fNamePrefix}_{translate($testFileNameVar, ':', '_')}.xml"><xsl:value-of select="$testName" /></a></td>
				</tr>
				<xsl:variable name="testData" select="document(concat('./',$fNamePrefix, '_', translate($testFileNameVar, ':', '_'), '.xml'))"/>
				<xsl:for-each select="$testData/ROOT/IYRESULTS/IYRESULTITEM">
					<tr class="row{position() mod 2}">
					<td></td>
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
				<td></td>
				<td>Estimated Yield</td>
				<td colspan="11"><xsl:value-of select="$testData/ROOT/IYRESULTS/IYESTIMATE/@estimated_yield" /><xsl:text>% (</xsl:text><xsl:value-of 	select="$testData/ROOT/IYRESULTS/IYESTIMATE/@estimated_yield_passed_count" /><xsl:text>/</xsl:text><xsl:value-of select="$testData/ROOT/IYRESULTS/IYESTIMATE/@estimated_yield_point_count" /><xsl:text>), </xsl:text><xsl:value-of select="$testData/ROOT/IYRESULTS/IYESTIMATE/@estimated_yield_errorPoint_count" /><xsl:text> errors</xsl:text></td>
				</tr>
				<tr class="rowSubHeader">
				<td></td>
				<td>Estimated Yield (No opregions)</td>

				<td colspan="11"><xsl:value-of select="$testData/ROOT/IYRESULTS/IYESTIMATE/@estimated_yield_noOpRegions" /><xsl:text>% 	(</xsl:text><xsl:value-of select="$testData/ROOT/IYRESULTS/IYESTIMATE/@estimated_yield_noOpRegions_passed_count" /><xsl:text>/</xsl:text><xsl:value-of 	select="$testData/ROOT/IYRESULTS/IYESTIMATE/@estimated_yield_noOpRegions_point_count" /><xsl:text>)</xsl:text></td>
				</tr>
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

<xsl:template name="replaceLineFeed">
   <xsl:param name="strInput"/>
   <xsl:choose>
      <xsl:when test="contains($strInput,'&#xA;')">
          <xsl:value-of select="substring-before($strInput,'&#xA;')"/>
              <br/>
               <xsl:call-template name="replaceLineFeed">
                   <xsl:with-param name="strInput">
                      <xsl:value-of select="substring-after($strInput,'&#xA;')"/>
                   </xsl:with-param>
                </xsl:call-template>
          </xsl:when>
          <xsl:otherwise>
                <xsl:value-of select="$strInput"/>
          </xsl:otherwise>
   </xsl:choose>
</xsl:template>

</xsl:stylesheet>
