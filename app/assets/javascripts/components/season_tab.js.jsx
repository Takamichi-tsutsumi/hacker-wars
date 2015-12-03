
var SeasonTab = React.createClass({
    render: function() {
        return <div className={this.props.className} >
            <ul>
                <Button
                    className={this.props.seasonId == "0" ? "active" : ""}
                    onSeasonButtonClick={this.handleButtonClick}
                    seasonName="Spring"
                    seasonId="0"
                />
                <Button
                    className={this.props.seasonId == "1" ? "active" : ""}
                    onSeasonButtonClick={this.handleButtonClick}
                    seasonName="Summer"
                    seasonId="1"
                />
                <Button
                    className={this.props.seasonId == "2" ? "active" : ""}
                    onSeasonButtonClick={this.handleButtonClick}
                    seasonName="Autumn"
                    seasonId="2"
                />
                <Button
                    className={this.props.seasonId == "3" ? "active" : ""}
                    onSeasonButtonClick={this.handleButtonClick}
                    seasonName="Winter"
                    seasonId="3"
                />
            </ul>
        </div>
    },
    handleButtonClick: function(season) {
        console.log(season);
        this.props.onSeasonChange(season);
    }
});

var Button = React.createClass({
    getInitialState: function() {
      return {
          season_name: this.props.seasonName,
          season_id: this.props.seasonId
      }
    },
    render: function() {
        return <li className={this.props.className} >
            <a
                href="#"
                className=""
                onClick={this.handleClick}
            >
                {this.props.seasonName}
            </a>
        </li>
    },
    handleClick: function() {
        this.props.onSeasonButtonClick({
            season_name : this.props.seasonName,
            season_id : this.props.seasonId
        })
    }
})