
var Header = React.createClass({
    render: function() {
        return <div className="header-menu">
            <div className="header">
                <a href="/">
                    <img src="img/logo.gif" width="185px" alt="" id="logo" />
                </a>
                <HeaderButtons userSignedIn={this.props.userSignedIn} />
                <SeasonTab
                    seasonId={this.props.seasonId}
                    onSeasonChange={this.seasonChange}
                    className="season"
                />
                <CategoryTab categoryId={this.props.categoryId} />
            </div>
        </div>
    },
    seasonChange: function(season) {
        this.props.seasonChange(season)
    }
});


var HeaderButtons = React.createClass({
    render: function() {
        if(this.props.userSignedIn) {
            return  <div className="header-buttons pull-right">
                <a href="/mypage" className="btn btn-default pull-right sign-out-button">My Page</a>
                <a
                    href="/users/sign_out"
                    className="btn btn-default pull-right sign-out-button"
                    data-method="delete"
                    rel="nofollow"
                >Sign Out
                </a>
            </div>
        } else {
            return <div className="header-buttons pull-right">
                <a
                    href="/users/auth/facebook"
                    className="btn btn-social btn-facebook"
                    style={{'float' : 'right', 'top' : '12px', 'right' : '15px', 'textDecoration' : 'none'}}
                >
                    <span className="fa fa-facebook"></span>Sign in with Facebook</a>
            </div>
        }
    }
});