$(function() {

  let category_search = $(".productForm__field--category");

   function appendChildSelect(child) {
      var html =
          `<div class="select-wrap" id="child-wrap" >
            <select  id="child-category" class="inputField inputField__select category" prompt="" name="child">
                <option value>---</option>
            </select>
          </div>`
      category_search.append(html)
    }

    function appendGrandChildSelect(grandchild) {
      var html =
          `<div class="select-wrap" id="grandchild-wrap" class="inputField inputField__select" prompt="">
            <select id="grandchild-category" class="inputField inputField__select category" prompt="" name="grandchild">
                <option value>---</option>
            </select>
          </div>`
      category_search.append(html)
    }

    function appendChild(child) {
      $("#child-category").append($("<option>").val($(child).attr('id')).text($(child).attr('name')))
    }

    function appendGrandChild(grandchild) {
      $("#grandchild-category").append($("<option>").val($(grandchild).attr('id')).text($(grandchild).attr('name')))
    }

  $('#item_category_id').change(function(e) {
      var parent = $(this).val();
      $("#child-wrap").remove();
      $("#grandchild-wrap").remove()

      if(parent == ""){
        $("#grandchild-wrap").remove()
        $("#grandchild-wrap").remove()
        return
      }

      $.ajax({ 
        url: '/items/search',
        type: 'GET',
        data: {parent: parent},
        dataType: 'json' 
      })
      .done(function(child) {
      
        appendChildSelect(child)
        child.forEach(function(child) {
          appendChild(child)
        })
      })
  })

  $(document).on('change', '#child-category', function() {
    
    var child = $(this).val();
    $("#grandchild-wrap").remove()
    
    $.ajax({ 
      url: '/items/search', 
      type: 'GET', 
      data: {child: child}, 
      dataType: 'json' 
    })

    .done(function(grandchild) {
      
      appendGrandChildSelect(grandchild)
      
      grandchild.forEach(function(grandchild) {
        appendGrandChild(grandchild)
      })
    })

  });

})
