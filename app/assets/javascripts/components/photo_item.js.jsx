
var PhotoItem = React.createClass({
    render: function(){
        return <div className="col-md-4 col-sm12">
            <a href="#modal-area">
                <img src={this.props.imgUrl} alt="Japanese Photo" style="width: 80%"/>
            </a>
        </div>
    }
})