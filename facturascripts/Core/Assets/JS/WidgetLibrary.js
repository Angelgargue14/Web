/*!
 * This file is part of FacturaScripts
 * Copyright (C) 2023-2024 Carlos Garcia Gomez <carlos@facturascripts.com>
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as
 * published by the Free Software Foundation, either version 3 of the
 * License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this program. If not, see <http://www.gnu.org/licenses/>.
 */
function widgetLibrarySearch(e){$("#list_"+e).html("<div class='col-12 text-center pt-5 pb-5'><i class='fa-solid fa-circle-notch fa-4x fa-spin'></i></div>");let t=$("div#"+e+" input.input-hidden"),a={action:"widget-library-search",active_tab:t.closest("form").find('input[name="activetab"]').val(),col_name:t.attr("name"),widget_id:e,query:$("#modal_"+e+"_q").val(),sort:$("#modal_"+e+"_s").val()};$.ajax({method:"POST",url:window.location.href,data:a,dataType:"json",success:function(t){$("div#list_"+e).html(t.html)},error:function(e){alert(e.status+" "+e.responseText)}})}function widgetLibrarySearchKp(e,t){"Enter"===t.key&&(t.preventDefault(),widgetLibrarySearch(e))}function widgetLibrarySelect(e,t,a){$("div#"+e+" input.input-hidden").val(t),$("div#"+e+" span.file-name").text(a),$("div#list_"+e+" div.file").removeClass("border-primary"),$("div#list_"+e+' div[data-idfile="'+t+'"]').addClass("border-primary"),$("#modal_"+e).modal("hide")}function widgetLibraryUpload(e,t){let a=$("div#"+e+" input.input-hidden"),i=new FormData;i.append("action","widget-library-upload"),i.append("active_tab",a.closest("form").find('input[name="activetab"]').val()),i.append("col_name",a.attr("name")),i.append("widget_id",e),i.append("file",t),$.ajax({method:"POST",url:window.location.href,data:i,dataType:"json",processData:!1,contentType:!1,success:function(t){$("div#list_"+e).html(t.html),1===t.records&&widgetLibrarySelect(e,t.new_file,t.new_filename)},error:function(e){alert(e.status+" "+e.responseText)}})}