define([
  'onion/struct'
], function(
  Struct
) {

  return Struct.sub('Selector')

    .attributes('selection')

    .proto({
      select: function (val) {
        this.setSelection(val)
      }
    })

})