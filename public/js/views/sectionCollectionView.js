// Generated by CoffeeScript 1.7.1

/*
Created by mart2967 on 1/30/14.
 */

(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  window.SectionCollectionView = (function(_super) {
    var convertGrade;

    __extends(SectionCollectionView, _super);

    function SectionCollectionView() {
      return SectionCollectionView.__super__.constructor.apply(this, arguments);
    }

    SectionCollectionView.prototype.events = {
      'change': 'change',
      'click button.add': 'addClass'
    };

    SectionCollectionView.prototype.initialize = function() {
      this.$el.append('<button class="add">Add Class</button>');
      return this.render();
    };

    SectionCollectionView.prototype.render = function() {
      _.each(this.collection.models, (function(item) {
        var view;
        view = new SectionView({
          model: item
        });
        this.$el.append(view.el);
      }), this);
      return this;
    };

    SectionCollectionView.prototype.change = function() {
      var creditsTotal, gradeTotal;
      gradeTotal = 0;
      creditsTotal = 0;
      _.each(this.collection.models, (function(item) {
        gradeTotal += convertGrade(item.get('grade')) * parseFloat(item.get('credits'));
        return creditsTotal += parseFloat(item.get('credits'));
      }));
      return $("#GPADisplay").html("Your GPA: " + (gradeTotal / creditsTotal));
    };

    SectionCollectionView.prototype.addClass = function() {
      var newSection, sectionList;
      newSection = new Section({
        grade: 'A',
        credits: '0'
      });
      newSection.save();
      this.$el.append(new SectionView({
        model: newSection
      }).el);
      sectionList = new window.SectionCollection();
      return sectionList.fetch({
        success: function() {
          $('#content').html(new window.SectionCollectionView({
            collection: sectionList
          }).$el);
          $('#bs-example-navbar-collapse-1').html(new window.NavbarView({
            collection: sectionList
          }).$el);
        }
      });
    };

    convertGrade = function(grade) {
      switch (grade.toUpperCase()) {
        case "A":
          return 4.0;
        case "A-":
          return 3.7;
        case "B+":
          return 3.33;
        case "B":
          return 3.0;
        case "B-":
          return 2.7;
        case "C+":
          return 2.3;
        case "C":
          return 2.0;
        case "C-":
          return 1.7;
        case "D+":
          return 1.3;
        case "D":
          return 1.0;
        case "D-":
          return 0.7;
        case "F":
          return 0.0;
        default:
          return 0.0;
      }
    };

    return SectionCollectionView;

  })(Backbone.View);

}).call(this);

//# sourceMappingURL=sectionCollectionView.map