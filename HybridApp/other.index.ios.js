import React, { Component, PropTypes } from 'react';
import {
    AppRegistry,
    Text,
    TouchableHighlight,
    View,
    ListView,
    StyleSheet,
    TextInput,
} from 'react-native';
import { StackNavigator, TabNavigator } from 'react-navigation';

class RecentChatsScreen extends React.Component {
  render() {
    return <Text>List of recent chats</Text>
  }
}

class AllContactsScreen extends React.Component {
  render() {
    return <Text>List of all contacts</Text>
  }
}

const AwesomeProject = TabNavigator({
  Recent: { screen: RecentChatsScreen },
  All: { screen: AllContactsScreen },
});

AppRegistry.registerComponent('AwesomeProject', () => AwesomeProject);

var styles = StyleSheet.create({
  container: {
    flex: 1,  // 自身在父容器中的宽高占比，如果没设flexDirection，则默认为垂直方向撑满屏幕，如果遇到有宽/高的设死的View则会撑满到该View
    // backgroundColor: 'orange',
    // alignItems: 'center',  // 在垂直于flexDirection方向的子控件布局方式
    // justifyContent: 'center',  // flexDirection方向的子控件布局方式
  },
  titleBar: {
    backgroundColor: 'green',
    height: 64,
    alignItems: 'center',
    justifyContent: 'center',
  },
  titleText: {
    textDecorationLine: 'underline', 
    backgroundColor: 'white',
  },
  inputContainer: {
    // flex: 1,  // 在此不用设置flex为1，会撑大高度，当设有高度为定值时，不要使用flex，此时会把高度撑高
    flexDirection: 'row',
    height: 40, 
    backgroundColor: 'green',
  },
  textInputStyle: {
    backgroundColor: '#ffff45',
    flex: 1,  // 设置flex，撑满，或者撑到写死宽高的容器，在这种情况下要设flex
    flexDirection: 'row',
    paddingLeft: 10,
  },
  addBtnContainer: {
    width: 80,
    backgroundColor: 'blue',
    alignItems: 'center',
    justifyContent: 'center',
  },
  addBtn: {
    backgroundColor: 'white',
  },
  cellContainer: {
    flexDirection: 'row',
    height: 44,
    padding: 10,
    // backgroundColor: 'white',
    alignItems: 'center',
    borderBottomWidth: 0.5,
  },
  cellText: {
    flex: 1,
    flexDirection: 'row',
    fontSize: 18,
    // backgroundColor: 'purple',
  },
  cellDeleteBtn: {
    width: 50,
    // backgroundColor: 'red',
  },
});
