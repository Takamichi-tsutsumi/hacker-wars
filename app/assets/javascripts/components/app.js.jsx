
var App = React.createClass({
    loadPhotosFromServer: function(season) {
      $.ajax({
          url: this.props.url + '?season=' + season.season_id + '&category=' + this.state.category_id ,
          dataType: 'json',
          success: function(result) {
              this.setState({
                  photo_data: result.data,
                  season_id: season.season_id
              });
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
        this.loadPhotosFromServer(season);
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
        var list = this.props.photoData.map(function(photo) {
            return <Photo {...photo} key={photo.id} />
        });
       return <div className="row" id="photo-list">
           {list}
       </div>
   }
});

var Photo = React.createClass({
    render: function() {
        return <div className="col-md-4 col-sm-12">
            <a href="#" onClick={this.modalBegin} >
                <img src={this.props.image.url} alt="photo Image" style={{width: "80%"}} />
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

