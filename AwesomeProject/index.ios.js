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

export default class AwesomeProject extends Component {
  constructor() {
    super()
    this.ds = new ListView.DataSource({rowHasChanged: (r1, r2) => r1 !== r2});
    this.todoList = ['row 1', 'row 2', 'row 3']
    this.state = {
      dataSource: this.ds.cloneWithRows(this.todoList),
      inputText: ''
    };
  }

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
        onChangeText={(text) => { this.setState({ inputText: text }) }}
        />
        <TouchableHighlight style={styles.addBtnContainer} onPress={this._addAction.bind(this)}>
          <Text style={styles.addBtn}>Add</Text>
        </TouchableHighlight>
        </View>
        <ListView
        dataSource={this.state.dataSource}
        renderRow={this._renderRow.bind(this)}
      />
      </View>
    )
  }

  _reloadList() {
    this.setState({
      dataSource: this.ds.cloneWithRows(this.todoList)
    })
  }

  _addAction() {
    console.log('press');
    this.todoList.push(this.inputText)
    this._reloadList()
  }

  _deleteAction(index) {
    console.log('delete');
    this.todoList.splice(index, 1)
    this._reloadList()
  }

  _renderRow(rowData, sectionID, index) {
    return (
      <View style={styles.cellContainer}>
        <Text style={styles.cellText}>{rowData}</Text>
        <TouchableHighlight onPress={this._deleteAction.bind(this, index)}>
          <Text style={styles.cellDeleteBtn}>Delete</Text>
        </TouchableHighlight>
      </View>
    );
  }
}

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
