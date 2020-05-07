## -*- coding: utf-8 -*-
<%!
import time
%>module("DataTableCustomIndex", package.seeall)
--
-- generated by xrescode on ${time.strftime("%Y-%m-%d %H:%M:%S")}, please don't edit it
--



% for pb_msg in pb_set.generate_message:
%   for loader in pb_msg.loaders:
-- ======================================== ${loader.code.class_name} ========================================
${loader.code.class_name} = {<%
    if loader.code.file_path:
      loader_data_source = ', filePath = "{0}"'.format(loader.code.file_path)
    elif loader.code.file_list:
      loader_data_source = ', filePath = "{0}"'.format(loader.code.file_path)
    else:
      loader_data_source = ''
%>
%     for code_index in loader.code.indexes:
<%
        if code_index.is_list():
          code_index_is_list = 'true'
        else:
          code_index_is_list = 'false'

        if code_index.allow_not_found:
          code_index_allow_not_found = 'true'
        else:
          code_index_allow_not_found = 'false'

        if loader.code:
          code_index_allow_not_found = 'true'
        else:
          code_index_allow_not_found = 'false'
%>    -- require("DataTableService").Get("${loader.code.class_name}"):GetByIndex("${code_index.name}", ${code_index.get_key_names()})
    { indexName = "${code_index.name}"${loader_data_source}, options = { isList = ${code_index_is_list}, allowNotFound = ${code_index_allow_not_found} }, keys = { ${code_index.get_key_names()} } },
%     endfor
}
%   endfor
% endfor

