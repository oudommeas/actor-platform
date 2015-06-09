'use strict';

var ActorAppDispatcher = require('../dispatcher/ActorAppDispatcher');
var ActorAppConstants = require('../constants/ActorAppConstants');
var ActorClient = require('../utils/ActorClient');
var ActionTypes = ActorAppConstants.ActionTypes;

var ContactActionCreators = require('../actions/ContactActionCreators');
var LoginStore = require('../stores/LoginStore');

var EventEmitter = require('events').EventEmitter;
var assign = require('object-assign');

var CHANGE_EVENT = 'change';

var _contacts = [];
var _isContactsOpen = false;

var ContactStore = assign({}, EventEmitter.prototype, {
  emitChange: function() {
    this.emit(CHANGE_EVENT);
  },

  addChangeListener: function(callback) {
    this.on(CHANGE_EVENT, callback)
  },

  removeChangeListener: function(callback) {
    this.removeListener(CHANGE_EVENT, callback)
  },

  getContacts: function() {
    return(_contacts);
  },

  isContactsOpen: function() {
    return(_isContactsOpen);
  }
});

var setContacts = function(contacts) {
  setTimeout(function() {
    ContactActionCreators.setContacts(contacts);
  }, 0);
};

ContactStore.dispatchToken = ActorAppDispatcher.register(function(action) {
  switch(action.type) {
    case ActionTypes.SET_LOGGED_IN:
      ActorAppDispatcher.waitFor([LoginStore.dispatchToken]);
      ActorClient.bindContacts(setContacts);
      break;

    case ActionTypes.CONTACT_LIST_SHOW:
      _isContactsOpen = true;
      ContactStore.emitChange();
      break;

    case ActionTypes.CONTACT_LIST_HIDE:
      _isContactsOpen = false;
      ContactStore.emitChange();
      break;

    case ActionTypes.CONTACT_LIST_CHANGED:
      _contacts = action.contacts;
      ContactStore.emitChange();
      break;

    case ActionTypes.CONTACT_ADD:
      ActorClient.addContact(action.uid);
      ContactStore.emitChange();
      break;

    case ActionTypes.CONTACT_REMOVE:
      ActorClient.removeContact(action.uid);
      ContactStore.emitChange();
      break;

    default:
  }
});

module.exports = ContactStore;