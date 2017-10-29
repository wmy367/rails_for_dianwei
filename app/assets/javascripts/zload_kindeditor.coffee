# coffeescript code
  $(document).on 'turbolinks:before-cache', ->
    KindEditor.remove('.rails_kindeditor')

  $(document).on 'turbolinks:load', ->
    $('.rails_kindeditor').each ->
      KindEditor.create "##{$(this).attr('id')}", "allowFileManager": true, "uploadJson": $(this).data('upload'), "fileManagerJson": $(this).data('filemanager'), "width": '100%', "height": '300', "items":["fontname","fontsize","|","forecolor","hilitecolor","bold","italic","underline","removeformat","|","justifyleft","justifycenter","justifyright","insertorderedlist","insertunorderedlist","|","emoticons","image","link"]
