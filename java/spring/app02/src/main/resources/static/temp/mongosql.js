db.payment.aggregate(
   [
     {

       $project:
          {
            amount : 1,
            paymentMonth: { $substr: [ "$paymentDate", 0, 7 ] }
          }
      }
   ]
)


// 최종. 월별 수강료 sum
db.payment.aggregate(
    [
        { $match: { delYn: false } }, // group by 하기전 대상조건
        { $project:
            {
                paymentMonth: { $substr: [ "$paymentDate", 0, 7 ] },
                amount : 1 // 나와야 하는 필드
            }
        },
        { $group: { _id: "$paymentMonth", sumAmount: { $sum: "$amount" } } }
    ]
)

db.payment.aggregate(
    [
        { $match: { delYn: false } }, // group by 하기전 대상조건
        { $project:
            {
                paymentMonth: { $substr: [ "$paymentDate", 0, 7 ] },
                amount : 1 // 나와야 하는 필드
            }
        },
        { $group:
            {
                _id: "$paymentMonth",
                sumAmount: { $sum: "$amount" },
                cntMember: { $sum : 1 }
            }
        },
        { $sort : { _id: 1 } }
    ]
)



{ $match: { delYn: false } }, { $project: { paymentMonth: { $substr: [ "$paymentDate", 0, 7 ] }, amount : 1 } }, { $group: { _id: "$paymentMonth", sumAmount: { $sum: "$amount" } } }



db.payment.aggregate(
    [
        { $match: { delYn: false } }, // group by 하기전 대상조건
        { $project:
            {
                paymentMonth: { $substr: [ "$paymentDate", 0, 7 ] },
                memberId : 1,
                amount : 1 // 나와야 하는 필드
            }
        },
        { $group:
            {
                _id: { paymentMonth : "$paymentMonth", memberId : "$memberId" },
                amount: { $sum: "$amount" },
                count: { $sum : 1 }

            }
        },
        { $sort : { _id: 1 } }
    ]
)




db.payment.aggregate(
    [
        { $match: { delYn: false } }, // group by 하기전 대상조건
        { $project:
            {
                paymentMonth: { $substr: [ "$paymentDate", 0, 7 ] },
                memberId : 1,
                amount : 1 // 나와야 하는 필드
            }
        },
        { $group:
            {
                _id: { paymentMonth : "$paymentMonth", memberId : "$memberId" },
                amount: { $sum: "$amount" }

            }
        },
        { $group:
            {
                _id: "$_id.paymentMonth",
                sumAmount: { $sum: "$amount" },
                cntMember: { $sum : 1 }

            }
        },
        { $sort : { _id: 1 } }
    ]
)

db.payment.aggregate([
{ $match: { delYn: false } },
{ $project: { paymentMonth: { $substr: [ "$paymentDate", 0, 7 ] }, memberId : 1, amount : 1 } },
{ $group: { _id: { paymentMonth : "$paymentMonth", memberId : "$memberId" }, amount: { $sum: "$amount" } } },
{ $group: { _id: "$_id.paymentMonth", sumAmount: { $sum: "$amount" }, cntMember: { $sum : 1 } } },
{ $sort : { _id: 1 } }
])




db.classEvent.aggregate(
    [
        { $match: { memberId : { $ne: "reservation" },  delYn: false } },
        { $group:
            {
                _id: "$classTime"
            }
        },
        { $sort : { _id: 1 } }
    ]
)


db.classEvent.aggregate([
{ $match: { memberId : { $ne: "reservation" },  classTime : { $ne: null }, delYn: false } },
{ $group: { _id: "$classTime" } },
{ $sort : { _id: 1 } }
])

db.classEvent.aggregate([
{ $match: { memberId : { $ne: "reservation" },  classTime : { $ne: null }, delYn: false } },
{ $group: { _id: "$classTime", count: { $sum : 1 } } },
{ $match: { count: { $gte : 3 } } },
{ $sort : { _id: 1 } }
])

db.classEvent.aggregate([
{ $match: { memberId : { $ne: "reservation" },  classTime : { $ne: null }, delYn: false } },
{ $group: { _id: "$classTime", count: { $sum : 1 } } },
{ $sort : { count: -1 } },
{ $limit : 5 },
{ $sort : { _id: 1 } }
])

//최근 5회 수업정보의 시간을 distinct 해서 보여준다.
db.classEvent.aggregate([
{ $match: { memberId: '61d6d0c438d7bc4f024d48ee',  classTime : { $ne: null }, delYn: false } },
{ $sort : { classDate: -1 } },
{ $limit : 5 },
{ $group: { _id: "$classTime", count: { $sum : 1 } } },
{ $sort : { _id: 1 } }
])

db.classEvent.aggregate([
{ $match: { memberId : { $ne: "reservation" },  classTime : { $ne: null }, delYn: false } },
{ $sort : { classDate: -1 } },
{ $limit : 20 },
{ $group: { _id: "$classTime", count: { $sum : 1 } } },
{ $sort : { _id: 1 } }
])