var ContentPackageAnalytics = React.createClass({
  getInitialState: function() {
    return {
      isLoading: true,
      pageViewCount: '',
      period: this.props.defaultPeriod
    };
  },
  handlePeriodChange: function(event) {
    this.setState({
      period: event.target.value
    }, function() {
      this.fetchData();
    });
  },
  fetchData: function() {
    this.setState({
      isLoading: true
    });
    $.get(this.props.analyticsPath, {
      period: this.state.period
    }, function(result) {
      if (this.isMounted()) {
        this.setState({
          isLoading: false,
          pageViewsCount: result.total,
          referrers: result.referrers,
          avg_time_on_page: result.avg_time_on_page
        });
      }
    }.bind(this)).fail(function(result) {
      this.setState({
        isLoading: false,
        error: result.responseJSON.error
      });
    }.bind(this));
  },
  componentDidMount: function() {
    this.fetchData();
  },
  render: function() {
    if (this.state.isLoading) {
      content = (
        <div className="text-center">
          <div className={this.state.isLoading
            ? ''
            : 'hide'}>
            <i className="fa fa-circle-o-notch fa-spin fa-2x"></i>
          </div>
        </div>
      );
    } else if (this.state.error) {
      content = (
        <h3>
          {this.state.error}
        </h3>
      );
    } else {
      content = (
        <div>
          <select onChange={this.handlePeriodChange} ref="period" value={this.state.period}>
            <option value="1"> Yesterday </option>
            <option value="7"> Last 7 days </option>
            <option value="30"> Last Month </option>
             <option value="365"> Last Year </option>
          </select>
          <label className="col-primary">Total page views</label>
          <p className="analytics-value">{this.state.pageViewsCount}</p>
          <label className="col-primary">Average time spent on page</label>
          <p className="analytics-value">{this.state.avg_time_on_page + " "}
            seconds</p>
          <label className="col-primary">Referrers</label>
          <AnalyticReferrers  data={this.state.referrers}/>
        </div>
      );
    }
    return (
      <div className="analytics-panel">
        {content}
      </div>
    );
  }
});

var AnalyticReferrers = React.createClass({
  render: function() {
    var referrerNodes = this.props.data.map(function(referrer) {
      return (
        <li className="analytics-referer">
          <strong>{referrer.name}
            -
            {referrer.total}</strong>
          <AnalyticReferrerKeyword  data={referrer.keywords}/>
        </li>
      );
    });
    return (
      <ul className="list-unstyled referrer-panel">
        {referrerNodes}
      </ul>
    );
  }
});

var AnalyticReferrerKeyword = React.createClass({
  render: function() {
    var keywordNodes = this.props.data.map(function(keyword) {
      return (
        <li>
          <span>{keyword.word}
            -
            {keyword.total}</span>
        </li>
      );
    });
    return (
      <ul className="list-unstyled">{keywordNodes}</ul>
    );
  }
});
