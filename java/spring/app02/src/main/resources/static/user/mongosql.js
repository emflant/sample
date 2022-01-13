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