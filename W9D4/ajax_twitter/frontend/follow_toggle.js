const APIUtil = require('./api_util.js')

const FollowToggle = function(el) { 
    this.$el = $(el)
    this.userId = this.$el.data('user-id');
    this.followState = this.$el.data('initial-follows-state');
    this.render();

    this.$el.on('click', this.handleClick.bind(this))
}

FollowToggle.prototype.render = function() {
    if (this.followState === "unfollowed") {
        this.$el.html('Follow!');
        setTimeout(() => {
            this.$el.prop('disabled', true);
        }, 2000)
        setTimeout(() => {
            this.$el.prop('disabled', false);
        }, 2000)
        
        

    } else {
        this.$el.html('Unfollow!');
        setTimeout(() => {
            this.$el.prop('disabled', true);
        }, 2000)
        setTimeout(() => {
            this.$el.prop('disabled', false);
        }, 2000)
    }
}

FollowToggle.prototype.handleClick = function(e) {
    e.preventDefault();
    if (this.followState === "unfollowed") {
        APIUtil.followUser(this.userId)
        this.followState = 'followed'
        this.render()
    } else {
        APIUtil.unfollowUser(this.userId)
        this.followState = 'unfollowed'
        this.render()
    }
}

module.exports = FollowToggle

