# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
# jQuery ->

    # $('#image-cropper').cropit();

    # // In the demos I'm passing in an imageState option
    # // so it renders an image by default:
    # // $('#image-cropper').cropit({ imageState: { src: { imageSrc } } });
    #
    # // Exporting cropped image
    # $('.download-btn').click(function() {
    #   var imageData = $('#image-cropper').cropit('export');
    #   window.open(imageData);
    # });



# jQuery ->
#     new AvatarCropper()
#
# class AvatarCropper
#     constructor: ->
#         $('#cropbox').Jcrop
#         aspectRatio: 1
#         setSelect: [0,0,600,600]
#         onSelect: @update
#         onChange: @update
#
#     update: (coords) =>
#         $('#user_crop_x').val(coords.x)
#         $('#user_crop_y').val(coords.y)
#         $('#user_crop_w').val(coords.w)
#         $('#user_crop_h').val(coords.h)
#         @updatePreview(coords)
#
#     updatePreview: (coords) =>
#         $('#preview').css
#             width: Math.round(100/coords.w * $('#cropbox').width()) + 'px'
#             height: Math.round(100/coords.h * $('#cropbox').height()) + 'px'
#             marginLeft: '-' + Math.round(100/coords.w * coords.x) + 'px'
#             marginTop: '-' + Math.round(100/coords.h * coords.y) + 'px'
