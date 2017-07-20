import React, { Component, PropTypes } from 'react';
import {
    AppRegistry,
    Text,
    TouchableHighlight,
    View,
    FlatList,
    StyleSheet,
    TextInput,
} from 'react-native';

var listData = ['one', 'two', 'three'];

export default class AwesomeProject extends Component {
  render() {
    return (
      <View style={styles.container}>
        <View style={styles.titleBar}>
          <Text style={styles.titleText}>To Do List</Text>
        </View>
        <View style={styles.inputContainer}>
          <TextInput 
        style={styles.textInputStyle} 
        placeholder='Please input here!' 
        />
        <TouchableHighlight style={styles.addBtnContainer} onPress={this._onPressButton}>
          <Text style={styles.addBtn}>Add</Text>
        </TouchableHighlight>
        </View>

        <FlatList 
          data={listData}
          renderItem = {this._renderItem}
        />
      </View>
    )
  }

  _onPressButton() {
    console.log('press');
  }

  _deleteAction() {
    console.log('delete');
  }

  _renderItem = ({item}) => (
    <View style={styles.cellContainer}>
      <Text style={styles.cellText}>{item}</Text>
      <TouchableHighlight onPress={this._deleteAction}>
        <Text style={styles.cellDeleteBtn}>Delete</Text>
      </TouchableHighlight>
    </View>
  );
}

AppRegistry.registerComponent('AwesomeProject', () => AwesomeProject);

var styles = StyleSheet.create({
  container: {
    flex: 1,  // 如果没设flexDirection，则默认为垂直方向撑满屏幕，如果遇到有宽/高的设死的View则会撑满到该View
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
    // flex: 1,  // 在此不用设置flex为1，会撑大高度，而不用设死的高度，可能外部的布局有影响
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
