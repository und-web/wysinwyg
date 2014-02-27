<!-- other stuff here, like <xsl:import />s, <xsl:param />s, etc. -->


<!-- carousel -->
<xsl:template match="table[@class='wysinwyg-carousel']" mode="recursive-copy">
	<div id="carousel-{generate-id()}" class="carousel slide right" data-ride="carousel">
		<ol class="carousel-indicators">
			<xsl:for-each select="./tbody/tr">
				<xsl:if test="position() = 1">
					<li data-target="#carousel-{generate-id(../..)}" data-slide-to="{position()}" class="active"><xsl:comment></xsl:comment></li>
				</xsl:if>
				<xsl:if test="position() > 1">
					<li data-target="#carousel-{generate-id(../..)}" data-slide-to="{position()}"><xsl:comment></xsl:comment></li>
				</xsl:if>
			</xsl:for-each>
		</ol>
		<div class="carousel-inner">
			<xsl:for-each select="./tbody/tr">
				<xsl:if test="position() = 1">
					<div class="active item">
						<xsl:copy-of select="./td[3]/*[not(name()='p')] | ./td[3]/p/*" />
						<xsl:if test="normalize-space(replace(./td[1], '&nbsp;', '')) != ''">
							<div class="carousel-top"><xsl:value-of select="normalize-space(replace(./td[1], '&nbsp;', ''))" /></div>
						</xsl:if>
						<xsl:if test="normalize-space(replace(./td[2], '&nbsp;', '')) != ''">
							<div class="carousel-bottom"><xsl:value-of select="normalize-space(replace(./td[2], '&nbsp;', ''))" /></div>
						</xsl:if>
					</div>
				</xsl:if>
				<xsl:if test="position() > 1">
					<div class="item">
						<xsl:copy-of select="./td[3]/*[not(name()='p')] | ./td[3]/p/*" />
						<xsl:if test="normalize-space(replace(./td[1], '&nbsp;', '')) != ''">
							<div class="carousel-top"><xsl:value-of select="normalize-space(replace(./td[1], '&nbsp;', ''))" /></div>
						</xsl:if>
						<xsl:if test="normalize-space(replace(./td[2], '&nbsp;', '')) != ''">
							<div class="carousel-bottom"><xsl:value-of select="normalize-space(replace(./td[2], '&nbsp;', ''))" /></div>
						</xsl:if>
					</div>
				</xsl:if>
			</xsl:for-each>
		</div>
		<a class="carousel-control left" href="#carousel-{generate-id()}" data-slide="prev">previous</a>
		<a class="carousel-control right" href="#carousel-{generate-id()}" data-slide="next">next</a>
	</div>
</xsl:template>

<!-- course list -->
<xsl:template match="table[@class='wysinwyg-courses']" mode="recursive-copy">
	<ul class="long-form courses">
		<xsl:for-each select="./tbody/tr">
			<li class="course" id="{normalize-space(replace(lower-case(./td[1]), ' ', ''))}">
				<h2><span class="number"><xsl:value-of select="./td[1]" /></span>&nbsp;<xsl:value-of select="./td[2]" /></h2>
				<p><xsl:copy-of select="./td[3]" /></p>
			</li>
		</xsl:for-each>
	</ul>
</xsl:template>

<!-- flex grid - two columns -->
<xsl:template match="table[@class='wysinwyg-flexgrid-two']" mode="recursive-copy">
	<div class="container-fluid">
		<xsl:for-each select="./tbody/tr">
			<div class="row">
				<xsl:if test="normalize-space(replace(./td[1], '&nbsp;', '')) != ''">
					<div class="col-sm-6">
						<xsl:copy-of select="./td[1]/*" />
					</div>
				</xsl:if>
				<xsl:if test="normalize-space(replace(./td[2], '&nbsp;', '')) != ''">
					<div class="col-sm-6">
						<xsl:copy-of select="./td[2]/*" />
					</div>
				</xsl:if>
			</div>
		</xsl:for-each>
	</div>
</xsl:template>

<!-- flex grid - three columns -->
<xsl:template match="table[@class='wysinwyg-flexgrid-three']" mode="recursive-copy">
	<div class="container-fluid">
		<xsl:for-each select="./tbody/tr">
			<div class="row">
				<xsl:if test="normalize-space(replace(./td[1], '&nbsp;', '')) != ''">
					<div class="col-md-4">
						<xsl:copy-of select="./td[1]/*" />
					</div>
				</xsl:if>
				<xsl:if test="normalize-space(replace(./td[2], '&nbsp;', '')) != ''">
					<div class="col-md-4">
						<xsl:copy-of select="./td[2]/*" />
					</div>
				</xsl:if>
				<xsl:if test="normalize-space(replace(./td[3], '&nbsp;', '')) != ''">
					<div class="col-md-4">
						<xsl:copy-of select="./td[3]/*" />
					</div>
				</xsl:if>
			</div>
		</xsl:for-each>
	</div>
</xsl:template>

<!-- Flickr -->
<xsl:template match="table[@class='wysinwyg-flickr']" mode="recursive-copy">
	<xsl:for-each select="./tbody/tr">
		<a class="flickr_gallery" href="{./td[1]}">Gallery loading... (Click to view if it doesn't load)</a>
	</xsl:for-each>
</xsl:template>

<!-- highlight box -->
<xsl:template match="table[@class='wysinwyg-highlight']" mode="recursive-copy">
	<xsl:for-each select="./tbody/tr">
		<section class="highlight">
			<h1><xsl:value-of select="td[1]" /></h1>
			<xsl:copy-of select="td[2]" />
		</section>
	</xsl:for-each>
</xsl:template>

<!-- honors projects -->
<xsl:template match="table[@class='wysinwyg-honors']" mode="recursive-copy">
	<xsl:for-each select="./tbody/tr">
		<xsl:processing-instruction name="php">
			include_once($_SERVER['DOCUMENT_ROOT'].'/_resources/php/_class.IWU_RSS.php');
			$honors_options = array(
				'feed' => '<xsl:value-of select="td[1]" />recent.rss',
				'style' => 'honors'
			);

			echo display_rss($honors_options);
		</xsl:processing-instruction>
		<!-- <?php  ?> -->
	</xsl:for-each>
</xsl:template>

<!-- people (faculty/staff) list -->
<xsl:template match="table[@class='wysinwyg-people']" mode="recursive-copy">
	<ul class="long-form bordered people">
		<xsl:for-each select="./tbody/tr">
			<li class="person">
				<a href="{./td[2]}"><img src="https://php.iwu.edu/directory/images/employees/100x150/{./td[1]}.jpg" /></a>
				<a href="{./td[2]}"><h2 class="name"><xsl:value-of select="./td[3]" /></h2></a>
				<p class="title"><xsl:value-of select="./td[4]" /></p>
				<p class="additional_line_1">(<xsl:value-of select="./td[5]" />)</p>
					<!--<xsl:value-of select="./td[6]" /> &mdash; <xsl:value-of select="td[7]" />-->
				<p class="description"><xsl:copy-of select="./td[9]" /></p>
				<p><em>Contact:</em> (309) 556-<xsl:value-of select="./td[8]" /> &mdash; <a href="mailto:{./td[1]}@iwu.edu"><xsl:value-of select="./td[1]" />@iwu.edu</a></p>
			</li>
		</xsl:for-each>
	</ul>
</xsl:template>

<!-- tabs -->
<xsl:template match="table[@class='wysinwyg-tabs']" mode="recursive-copy">
	<ul class="nav nav-tabs" id="tabs-{generate-id()}">
		<xsl:for-each select="./tbody/tr">
			<xsl:if test="position() = 1">
				<li class="active"><a href="#tabs-area-{position()}"><xsl:value-of select="./td[1]" /></a></li>
			</xsl:if>
			<xsl:if test="position() > 1">
				<li><a href="#tabs-area-{position()}"><xsl:value-of select="./td[1]" /></a></li>
			</xsl:if>
		</xsl:for-each>
	</ul>

	<div class="tab-content">
		<xsl:for-each select="./tbody/tr">
			<xsl:if test="position() = 1">
				<div class="tab-pane active" id="tabs-area-{position()}"><xsl:copy-of select="./td[2]/*" /></div>
			</xsl:if>
			<xsl:if test="position() > 1">
				<div class="tab-pane" id="tabs-area-{position()}"><xsl:copy-of select="./td[2]/*" /></div>
			</xsl:if>
		</xsl:for-each>
	</div>
</xsl:template>

<!-- thermometer -->
<xsl:template match="table[@class='wysinwyg-thermometer']" mode="recursive-copy">
	<xsl:for-each select="./tbody/tr">
		<div class="thermometer horizontal">
			<div class="track">
				<div class="goal">
					<div class="amount"><xsl:value-of select="./td[1]" /></div>
				</div>
				<xsl:if test="normalize-space(replace(./td[4], '&nbsp;', '')) != ''">
					<div class="intermediary">
						<div class="amount"><xsl:value-of select="./td[4]" /></div>
					</div>
				</xsl:if>
				<xsl:if test="normalize-space(replace(./td[5], '&nbsp;', '')) != ''">
					<div class="intermediary">
						<div class="amount"><xsl:value-of select="./td[5]" /></div>
					</div>
				</xsl:if>
				<xsl:if test="normalize-space(replace(./td[6], '&nbsp;', '')) != ''">
					<div class="intermediary">
						<div class="amount"><xsl:value-of select="./td[6]" /></div>
					</div>
				</xsl:if>
				<xsl:if test="normalize-space(replace(./td[7], '&nbsp;', '')) != ''">
					<div class="intermediary">
						<div class="amount"><xsl:value-of select="./td[7]" /></div>
					</div>
				</xsl:if>
				<xsl:if test="normalize-space(replace(./td[2], '&nbsp;', '')) != ''">
					<div class="progress">
						<div class="amount"><xsl:value-of select="./td[2]" /></div>
					</div>
				</xsl:if>
				<xsl:if test="normalize-space(replace(./td[3], '&nbsp;', '')) != ''">
					<div class="pledged">
						<div class="amount"><xsl:value-of select="./td[3]" /></div>
					</div>
				</xsl:if>
			</div>
		</div>
	</xsl:for-each>
</xsl:template>


<!-- other stuff here, like page template references -->
