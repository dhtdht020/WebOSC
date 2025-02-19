<#import "includes/base-layout.ftl" as layout>
<#-- Rename this to a more appropriate filename later... This will be reused for subcategories once they are implemented (e.g., having a list of game genres) -->
<@layout.header.header "Search by Publisher">
	<script type="text/javascript">
		shop.setWallpaper(WallpaperType.DOTTED_HORIZONTAL_LINES);

		function onLoad() {
			onLoadCommon();
		}
	</script>

	<style type="text/css">
		#main-content {
			padding: 3px 0px;
			margin: 0px 30px 0px 36px;
			border: 1px solid #35beed;
			background-color: #c4fbff;
			/*width: 490px;*/
		}

		.items {
			/* :( */
			margin-left: -8px;
		}

		/* different browsers handle this differently...
		 * - on the WSC the space on the bottom of the container is about the same as the top
		 * - on Firefox the space on the bottom of the container is about the same as the top + that of the bottom items
		 * - on Chrome there isn't space at the bottom of the container at all
		 * anything to do with items is just hacky */
		.items > .item {
			float: left;
			margin: 0px 0px 4px 8px;
		}

		.btn-item {
			padding: 0;
			font-size: 14px;
		}

		/* yaaay dumb hacks i have to do to bump the title down 1px and not affect everything when you hover (indicated by "yep") */
		.btn-item .top {
			padding: 3px;
			/* padding-top: 3px;*/ /* yep (ok well maybe not because while it's more accurate on desktop, it's not on Wii. AAAAAAAARRRGGGGHHHH */
			line-height: 1;
		}

		.btn-item .sep {
			height: 1px;
			display: block;
			background-color: #34beed;
			margin: 0px 11px;
			margin-top: -2px; /* yep */
		}

		/* This *really* affects SVG button performance */
		.btn-item:hover .sep {
			outline: 1px solid #34beed; /* use outline because it doesn't affect flow as it doesn't change element height (yep) */
			margin: 0px 12px;
			margin-top: -2px; /* yep */
		}

		/* TODO: fixed size for the title count specifically */
		.btn-item .bottom {
			text-align: right;
			padding: 0px 8px;
			line-height: 1;
		}
	</style>
</@layout.header.header>

<@layout.navigation headerTitle="Search by Publisher" headerBtns=true/>

<#macro btnItem name titles>
	<a class="btn btn-item" href="/search?category=${category}&type=publishers&query=${name?url}" style="width: 233px; height: 51px">
		<span><span class="top">${name}</span></span>
		<span><span><span class="sep"></span></span></span>
		<span><span class="bottom">${titles}</span></span>
	</a>
</#macro>

<@layout.page>
	<div class="items">
		<#list publishers as publisher, titles>
		<div class="item"><@btnItem publisher "Titles: ${titles}"/></div>
		</#list>
	</div>
</@layout.page>

<@layout.footer>
	<div id="main-footer-btns">
		<@layout.osc.btn body="Back" class="btn-cancel" id="back-btn" href="javascript:history.back()"/>
	</div>
</@layout.footer>