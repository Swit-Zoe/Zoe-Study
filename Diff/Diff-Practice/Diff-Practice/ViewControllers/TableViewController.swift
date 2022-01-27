//
//  TableViewController.swift
//  Diff-Practice
//
//  Created by Zoe on 2022/01/26.
//

import UIKit
import Differ

class TableViewController: UIViewController {
    
    // MARK: - Properties
    
    var dummyData1: [DummyModel] = [
        DummyModel(message: "기본 셀", reaction: ["1","2","3","4"], files: ["a.png", "ab.png", "a.docs"], comments: ["안녕", "ㅎㅇㅎㅇ"]),
        DummyModel(message: "기본 셀", reaction: ["1","2","3","4"], files: ["a.png", "ab.png", "a.docs"], comments: ["안녕", "ㅎㅇㅎㅇ"]),
        DummyModel(message: "기본 셀", reaction: ["1","2","3","4"], files: ["a.png", "ab.png", "a.docs"], comments: ["안녕", "ㅎㅇㅎㅇ"]),
        DummyModel(message: "기본 셀", reaction: ["1","2","3","4"], files: ["a.png", "ab.png", "a.docs"], comments: ["안녕", "ㅎㅇㅎㅇ"]),
        DummyModel(message: "기본 셀", reaction: ["1","2","3","4"], files: ["a.png", "ab.png", "a.docs"], comments: ["안녕", "ㅎㅇㅎㅇ"]),
        DummyModel(message: "기본 셀", reaction: ["1","2","3","4"], files: ["a.png", "ab.png", "a.docs"], comments: ["안녕", "ㅎㅇㅎㅇ"]),
        DummyModel(message: "기본 셀", reaction: ["1","2","3","4"], files: ["a.png", "ab.png", "a.docs"], comments: ["안녕", "ㅎㅇㅎㅇ"]),
        DummyModel(message: "기본 셀", reaction: ["1","2","3","4"], files: ["a.png", "ab.png", "a.docs"], comments: ["안녕", "ㅎㅇㅎㅇ"]),
        DummyModel(message: "기본 셀", reaction: ["1","2","3","4"], files: ["a.png", "ab.png", "a.docs"], comments: ["안녕", "ㅎㅇㅎㅇ"]),
        DummyModel(message: "기본 셀", reaction: ["1","2","3","4"], files: ["a.png", "ab.png", "a.docs"], comments: ["안녕", "ㅎㅇㅎㅇ"]),
        DummyModel(message: "기본 셀", reaction: ["1","2","3","4"], files: ["a.png", "ab.png", "a.docs"], comments: ["안녕", "ㅎㅇㅎㅇ"]),
    ]
    
    var dummyData2: [DummyModel] = [
        DummyModel(message: "기본 셀", reaction: ["1","2","3","4"], files: ["a.png", "ab.png", "a.docs"], comments: ["안녕", "ㅎㅇㅎㅇ"]),
        DummyModel(message: "메세지 수정시 이렇게", reaction: ["1","2","3","4"], files: ["a.png", "ab.png", "a.docs"], comments: ["안녕", "ㅎㅇㅎㅇ"]),
        DummyModel(message: "기본 셀", reaction: ["1","2","3","4"], files: ["a.png", "ab.png", "a.docs"], comments: ["안녕", "ㅎㅇㅎㅇ"]),
        DummyModel(message: "리액션 갯수 수정", reaction: ["1","2","3"], files: ["a.png", "ab.png", "a.docs"], comments: ["안녕", "ㅎㅇㅎㅇ"]),
        DummyModel(message: "기본 셀", reaction: ["1","2","3","4"], files: ["a.png", "ab.png", "a.docs"], comments: ["안녕", "ㅎㅇㅎㅇ"]),
        DummyModel(message: "리액션 내용 수정\n두줄이면?", reaction: ["1","2","3","5"], files: ["a.png", "ab.png", "a.docs"], comments: ["안녕", "ㅎㅇㅎㅇ"]),
        DummyModel(message: "파일 하나 삭제", reaction: ["1","2","3","4"], files: ["a.png", "a.docs"], comments: ["안녕", "ㅎㅇㅎㅇ"]),
        DummyModel(message: "기본 셀", reaction: ["1","2","3","4"], files: ["a.png", "ab.png", "a.docs"], comments: ["안녕", "ㅎㅇㅎㅇ"]),
        DummyModel(message: "파일 전체 삭제", reaction: ["1","2","3","4"], files: [], comments: ["안녕", "ㅎㅇㅎㅇ"]),
        DummyModel(message: "코멘트 추가", reaction: ["1","2","3","4"], files: ["a.png", "ab.png", "a.docs"], comments: ["안녕", "ㅎㅇㅎㅇ", "ㅇㅇ"]),
        DummyModel(message: "코멘트 전체 삭제", reaction: ["1","2","3","4"], files: ["a.png", "ab.png", "a.docs"], comments: []),
    ]
    
    let refreshControl = UIRefreshControl()
    var data: [DummyModel] = []
    var toggleFlag: Bool = false
    var diff: ExtendedDiff?
    
    // MARK: - @IBOutlet Properties
    
    @IBOutlet weak var testTableView: UITableView!
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initNavigationBar()
        initTableView()
        fetchInitialData()
    }
    
    // MARK: - Functions
    
    private func initNavigationBar() {
        self.navigationController?.initRefreshButton(navigationItem: self.navigationItem,
                                                     doneButtonClosure: #selector(self.toggle))
        
        self.navigationController?.initBarButtons(navigationItem: self.navigationItem,
                                                  buttons: [
                                                    UIBarButtonItem(image: UIImage(systemName: "list.bullet.circle"),
                                                                    style: .plain,
                                                                    target: self.navigationController?.topViewController,
                                                                    action: #selector(self.printDiff)),
                                                  ])
    }
    
    private func initTableView() {
        testTableView.delegate = self
        testTableView.dataSource = self
        testTableView.allowsMultipleSelection = true
        testTableView.register(UINib(nibName: "TestTableViewCell", bundle: nil), forCellReuseIdentifier: "TestTableViewCell")
    }
    
    private func fetchInitialData() {
        data = dummyData1
    }
    
    @objc func toggle() {
        toggleFlag.toggle()
        if toggleFlag {
            data = dummyData2
            
            // MARK: 데이터 업데이트 함수 둘 중 택1 - useDiffer
            useDiffer(old: dummyData1, new: dummyData2)
        } else {
            data = dummyData1
            
            // MARK: 데이터 업데이트 함수 둘 중 택1 - useDiffer
            reconfigureTableViewCells(old: dummyData2, new: dummyData1)
        }
    }
    
    // MARK: 수정된 cell들 선택. 연관 값 사용해서 더 다양한 동작 수행 가능
    @objc func printDiff() {
        
        guard let diff = diff else {
            return
        }
        
        print(diff)
        
        print("updated된 cell들 전체 출력")
        diff.elements.forEach { element in
            if case let .insert(at) = element {
                print(at)
                self.testTableView.selectRow(at: IndexPath(row: at, section: 0), animated: true, scrollPosition: .top)
            }
        }
        print("--------------------")
    }
    
    // data 변경하고 cell 조정
    func useDiffer(old: [DummyModel], new: [DummyModel]){
        diff = old.extendedDiff(new)
        
        // performWithoutAnimation을 사용해 animation 없이 cell 조정
        UIView.performWithoutAnimation {
            testTableView.animateRowChanges(oldData: old,
                                            newData: new,
                                            deletionAnimation: .none,
                                            insertionAnimation: .none)
        }
    }
    
    // MARK: animation 없이 cell 조정 - dynamic height 면 애니메이션 발생. 어차피 performWithoutAnimation 써야 함
    func reconfigureTableViewCells(old: [DummyModel], new: [DummyModel]) {
        diff = old.extendedDiff(new)
        
        guard let diff = diff else {
            return
        }
        
        diff.elements.forEach { Element in
            if case let .insert(at) = Element {
                UIView.performWithoutAnimation {
                    testTableView.reconfigureRows(at: [IndexPath(row: at, section: 0)])
                }
            }
            if case let .delete(at) = Element {
                UIView.performWithoutAnimation {
                    testTableView.reconfigureRows(at: [IndexPath(row: at, section: 0)])
                }
            }
        }
    }
    
}

// MARK: - UITableViewDelegate

extension TableViewController: UITableViewDelegate {
    
}

// MARK: - UITableViewDataSource

extension TableViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TestTableViewCell", for: indexPath) as? TestTableViewCell else {
            return UITableViewCell()
        }
        
        cell.setCell(data: data[indexPath.row])
        
        return cell
    }
    
    
}
