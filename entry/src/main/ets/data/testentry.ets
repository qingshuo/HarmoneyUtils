import entry from 'libmidentry.so'

export default class testentry {
  testadd() {
    const testnum = entry.add(11, 11)

    console.log('sample', ' testnum :' + testnum);

  }
}