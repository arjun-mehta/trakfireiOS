SC.initialize({
              client_id: '8f3c9a26a2975409bfc5f52f8fcbb1ae'
              });

SC.stream("/tracks/293", {
          autoPlay: true,
          ontimedcomments: function(comments){
          console.log(comments[0].body);
          }
          });

alert("hello")