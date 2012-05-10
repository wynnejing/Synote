<!-- set thumbnail url -->
<g:if test="${row.thumbnail != null && row.isVideo==true}">
	<g:set var="thumbnail_src" value="${row.thumbnail}"/>
</g:if>
<g:elseif test="${row.isVideo == false}">
	<g:set var="thumbnail_src" value="${resource(dir: 'images', file: 'audio_default.png')}"/>
</g:elseif>
<g:else>
	<g:set var="thumbnail_src" value="${resource(dir: 'images', file: 'video_default.jpg')}"/>
</g:else>

<!-- set title depending on length -->
<g:if test="${row.title?.size() > 50}">
	<g:set var="s_title" value="${row.title?.substring(0,50)+'...'}"/>
</g:if>
<g:elseif test="${row.title?.size() > 0}">
	<g:set var="s_title" value="${row.title}"/>
</g:elseif>
<g:else>
	<g:set var="s_title" value="${null}"/>
</g:else>

<div class="synmark-row row">
	<div class="span2">					
		<img style="width: 120px; height: 90px;" src="${thumbnail_src}"/>
		<br/>
		<span>start:${row.start}</span><br/>
		<span>end:${row.end}</span>
	</div>
	<div class="span8">
	  	<h3 class="heading-inline">
		  	<g:if test="${s_title != null}">
		  		${s_title}
		  	</g:if>
		  	<g:else>
		  		<i>Title not available</i>
	  		</g:else>
	  	</h3>
	  	<br/>
	  	<span class="datetime-info">${row.date_created}</span><br>
	  	<div style="padding: 5px 0px;">
	  		<p>${row.note?.size()>0?row.note: "No description"}</p>
	  	</div>
	  	<div>
	  		<g:each var="tag" in="${row.tags}">
	  			<span class="badge badge-tag"><i class="icon-tag tag-item icon-white"></i>${tag}</span>
	  		</g:each>
	  	</div>
	  	<div class="btn-group pull-right">
	 		<a href="#" data-toggle="dropdown" class="btn dropdown-toggle">
	  			Actions<span class="caret"></span></a>
	  		<ul class="dropdown-menu">
	  				<li><g:link controller="multimediaResource" action="replay" id="${row.id}">Details</g:link></li>
	  				<li><g:link controller="multimediaResource" action="replay" id="${row.id}">Edit</g:link>
	  				</li><li class="divider"></li>
	  				<li><g:link controller="recording" action="replay" id="${row.rid}" fragment="${row.mf }">Play it in Synote Player</g:link></li>
	  				<li><g:link controller="recording" action="print" id="${row.id}" fragment="${row.mf }">Print Friendly Version</g:link></li>
	 		</ul>
	 	</div>
	</div>
</div>