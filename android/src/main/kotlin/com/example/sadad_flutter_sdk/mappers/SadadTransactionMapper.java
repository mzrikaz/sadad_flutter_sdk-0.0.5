package com.example.sadad_flutter_sdk.mappers;

import android.os.Bundle;

import com.example.sadad_flutter_sdk.entities.SadadOrdrItem;
import com.example.sadad_flutter_sdk.entities.SadadTransaction;
import com.sadadsdk.model.SadadOrder;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;


public class SadadTransactionMapper {

    public Bundle toBundle(SadadTransaction transaction) {

        String mobileNumber = transaction.getMobileNumber();
        String customerId = transaction.getCustomerId();
        String clientToken = transaction.getClientToken();
        String orderId = transaction.getOrderId();
        String transactionAmount = transaction.getTransactionAmount();

        Bundle bundle = new Bundle();
        bundle.putString(SadadOrder.ACCESS_TOKEN, clientToken);
        bundle.putString(SadadOrder.CUST_ID, customerId);
        bundle.putString(SadadOrder.ORDER_ID, orderId);
        bundle.putString(SadadOrder.TXN_AMOUNT, transactionAmount);
        bundle.putString(SadadOrder.MOBILE_NO, mobileNumber);
        JSONArray jsonArray = new JSONArray();
        for (SadadOrdrItem orderItem : transaction.getOrderItems()) {
            JSONObject jsonObject = new JSONObject();
            try {
                jsonObject.put("itemname", orderItem.getName());
                jsonObject.put("quantity", orderItem.getQuantity());
                jsonObject.put("amount", orderItem.getAmount());
            } catch (JSONException e) {
                e.printStackTrace();
            }
            jsonArray.put(jsonObject);
        }
        bundle.putString(SadadOrder.ORDER_DETAIL, String.valueOf(jsonArray));
        return bundle;
    }
}
