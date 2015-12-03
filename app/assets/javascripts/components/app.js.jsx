
var App = React.createClass({
    loadPhotosFromServer: function() {
      $.ajax({
          url: this.props.url + '?season=' + this.state.season_id + '&category=' + this.state.category_id ,
          dataType: 'json',
          success: function(result) {
              this.setState({data: result.data});
          }.bind(this),
          error: function(xhr, status, err) {
              console.error(this.props.url, status, err.toString());
          }.bind(this)
      })
    },
    getInitialState: function() {
        return {
            season_id : 0,
            category_id : 0,
            user_signed_in : false,
            photo_data: this.props.data
        }
    },
    render: function() {
      return <div>
          <Header
              seasonId={this.state.season_id}
              categoryId={this.state.category_id}
              userSignedIn={this.state.user_signed_in}
              seasonChange={this.handleSeasonChange}
          />
          <Main photoData={this.state.photo_data} />

      </div>

    },
    handleSeasonChange: function(season) {
        this.setState({
            season_id: season.season_id
        })
    }
});

var Main = React.createClass({
    render: function() {
        return <div className="container">
            <div className="library">
                <PhotoItems photoData={this.props.photoData} />
            </div>
            <Modal />
        </div>
    }
});

var PhotoItems = React.createClass({
    render: function() {
        var list = this.props.photoData.map(function(photoData) {
            return <Photo {...photoData} />
        });
       return <div className="row" id="photo-list">
           {list}
       </div>
   }
});

 //
 //<div class="library">
 //   <div class="row" id="photo-list">
 //     <% @photos.each do |photo|%>
 //       <div class="col-md-4 col-sm-12">
 //         <a rel="leanModal" href="#modal-area" onClick="set_modal('<%= photo.image.to_s %>', '<%= photo.text.to_s %>', '<%= user_favorite_check(current_user, photo.id) %>', '<%= photo.id %>', '<%= photo.organization.id %>')"><%= image_tag(photo.image, :width => "80%", :alt => "" ) %></a>
 //        </div>
 //     <% end %>
 //   </div>
 // </div>


var Photo = React.createClass({
    render: function() {
        return <div className="col-md-4 col-sm-12">
            <a href="#" onClick={this.modalBegin} >
                <img src={this.props.imgUrl} alt="photo Image"/>
            </a>
        </div>
    }
});


var Modal = React.createClass({
    render: function() {
        return <div id="modal-area">
            <img id="modal_image" alt="" /><p id="modal_text_target"></p>
            <a href="" id="to-org"><div id="detail"><p>Area Detail</p></div></a>
        </div>

    }
});

